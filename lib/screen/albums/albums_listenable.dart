import 'package:flutter/foundation.dart';
import 'package:functional_listener/functional_listener.dart';

import 'album_tile_model_data.dart';
import 'albums_notifier.dart';

extension AlbumsListenable on AlbumsNotifier {
  /// The list of albums.
  ValueListenable<List<AlbumTileModelData>> get albumList => map((m) => m.albumTileModelDataList);

  /// The number of favorited albums.
  ValueListenable<int> get favoriteAlbumCount =>
      map((m) => m.albumTileModelDataList.where((album) => album.favorite).toList().length);

  /// True if the progress indicator should be shown, false otherwise.
  ValueListenable<bool> get showLoadingIndicator => map((m) => m.loading);
}
