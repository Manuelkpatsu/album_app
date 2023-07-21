import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

import 'albums_domain_model.dart';
import 'albums_model_data.dart';

class AlbumsNotifier extends ValueNotifier<AlbumsModelData> {
  final AlbumsDomainModel _domainModel;
  final Logger _logger;

  AlbumsNotifier(this._domainModel, this._logger) : super(const AlbumsModelData());

  void init(int artistID) {
    _domainModel
        .getAlbumsModelDataStream(artistID)
        .listen((modelData) => value = modelData)
        .onError((error, stackTrace) {
      _logger.e('Error subscribing to artist: $artistID albums\' stream', error, stackTrace,);
    });
  }

  @override
  void dispose() {
    _domainModel.dispose();
    super.dispose();
  }
}
