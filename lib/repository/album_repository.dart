import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:test_app/model/album.dart';
import 'package:test_app/model/albums_response.dart';

class AlbumRepository {
  final Dio _dio;

  AlbumRepository(this._dio);

  /// Gets the albums for the given artist ID.
  ///
  /// [artistID] ID of the artist.
  Future<List<Album>> getAlbumsForArtist(int artistID) {
    return _dio.get(
      '/lookup',
      queryParameters: {'id': artistID, 'entity': 'album'},
    ).then((response) {
      if (response.statusCode == 200) {
        return AlbumsResponse.fromJson(jsonDecode(response.data)).albumList;
      } else {
        return Future.error(
          'Failed to get album. statusCode: ${response.statusCode}, statusMessage: ${response.statusMessage}',
        );
      }
    });
  }
}
