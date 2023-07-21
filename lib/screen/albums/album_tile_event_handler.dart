import 'dart:async';

import 'package:logger/logger.dart';
import 'package:test_app/screen/navigation_controller.dart';

import 'album_tile_event.dart';
import 'albums_domain_model.dart';

class AlbumTileEventHandler {
  final AlbumsDomainModel _domainModel;
  final Logger _logger;
  final NavigationController _controller;
  late final StreamController<AlbumTileEvent> _eventController;

  AlbumTileEventHandler(this._domainModel, this._logger, this._controller);

  void init(StreamController<AlbumTileEvent> eventController) {
    _eventController = eventController;
    _eventController.stream.listen((event) => _handleEvent(event)).onError((error, stackTrace) {
      _logger.e("Error handling album tile event", error, stackTrace);
    });
  }

  /// Handles [AlbumTileEvent]s
  _handleEvent(AlbumTileEvent event) {
    if (event is FavoriteEvent) {
      if (event.albumID != null) {
        _domainModel.favoriteAlbum(event.albumID!, event.favorite);
      } else {
        _logger.w('Favoriting an album with no ID');
        _controller.showSnackBar('Album cannot be favorited because it has no ID.');
      }
    } else {
      _logger.w('Unhandled album tile event type: ${event.runtimeType}');
    }
  }

  void dispose() {
    _eventController.close();
  }
}
