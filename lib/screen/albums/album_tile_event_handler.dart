import 'dart:async';

import 'package:logger/logger.dart';

import 'album_tile_event.dart';
import 'albums_domain_model.dart';

class AlbumTileEventHandler {
  final AlbumsDomainModel _domainModel;
  final Logger _logger;
  late final StreamController<AlbumTileEvent> _eventController;

  AlbumTileEventHandler(this._domainModel, this._logger);

  void init(StreamController<AlbumTileEvent> eventController) {
    _eventController = eventController;
    _eventController.stream.listen((event) => _handleEvent(event)).onError((error, stackTrace) {
      _logger.e("Error handling album tile event", error, stackTrace);
    });
  }

  /// Handles [AlbumTileEvent]s
  _handleEvent(AlbumTileEvent event) {
    if (event is FavoriteEvent) {
      _domainModel.favoriteAlbum(event.albumID, event.favorite);
    } else {
      _logger.w('Unhandled album tile event type: ${event.runtimeType}');
    }
  }

  void dispose() {
    _eventController.close();
  }
}
