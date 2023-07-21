import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test_app/repository/album_repository.dart';

import 'album_tile_model_data.dart';
import 'albums_model_data.dart';

class AlbumsDomainModel {
  final List<int> favoriteAlbums = [];
  final _albumsModelDataSubject = BehaviorSubject<AlbumsModelData>();
  final AlbumRepository _albumRepository;
  final Logger _logger;

  AlbumsDomainModel(this._albumRepository, this._logger);

  /// Gets the albums model data stream for the given artists ID.
  ///
  /// [artistID] ID of the artist.
  BehaviorSubject<AlbumsModelData> getAlbumsModelDataStream(int artistID) {
    if (!_albumsModelDataSubject.hasListener) {
      _refreshData(artistID);
    }
    return _albumsModelDataSubject;
  }

  /// Gets the albums for the given artists ID.
  ///
  /// [artistID] ID of the artist.
  void _refreshData(int artistID) {
    _logger.d('Getting album list for artist: $artistID');

    _albumsModelDataSubject.add(const AlbumsModelData(loading: true));

    _albumRepository.getAlbumsForArtist(artistID).then((albumList) {
      final filteredAlbumList = albumList.where((album) => album.collectionId != null).toList();
      final albumTileModelDataList = filteredAlbumList
          .map((album) => AlbumTileModelData(
                id: album.collectionId!,
                name: album.collectionName,
                thumbnail: album.artworkUrl100,
                price: album.collectionPrice,
                currency: album.currency,
              ))
          .toList();

      final modelData = AlbumsModelData(
        albumTileModelDataList: albumTileModelDataList,
      );
      _albumsModelDataSubject.add(modelData);
    }).whenComplete(() {
      AlbumsModelData modelData;
      if (_albumsModelDataSubject.hasValue) {
        modelData = _albumsModelDataSubject.value.copyWith(loading: false);
      } else {
        modelData = const AlbumsModelData(loading: false);
      }
      _albumsModelDataSubject.add(modelData);
    }).catchError(((error, stackTrace) {
      _logger.e('Error getting albums for artist: $artistID', error, stackTrace);
    }));
  }

  /// Favorite an album for the given album ID
  ///
  /// [albumID] the album ID
  /// [favorite] true if the album should be favorited, false otherwise
  void favoriteAlbum(int albumID, bool favorite) {
    _logger.d('Favoriting album with ID: $albumID');

    if (favorite) {
      favoriteAlbums.add(albumID);
    } else {
      favoriteAlbums.remove(albumID);
    }

    if (_albumsModelDataSubject.hasValue) {
      final modelData = _albumsModelDataSubject.value;
      final albumTileModelDataList = modelData.albumTileModelDataList.map((album) {
        bool favorite = favoriteAlbums.contains(album.id);
        return album.copyWith(favorite: favorite);
      }).toList();

      final updatedModelData = modelData.copyWith(
        albumTileModelDataList: albumTileModelDataList,
      );
      _albumsModelDataSubject.add(updatedModelData);
    } else {
      _logger.w('_albumsModelDataSubject has no value');
    }
  }

  void dispose() {
    _albumsModelDataSubject.close();
  }
}
