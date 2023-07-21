import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import 'repository/album_repository.dart';
import 'screen/albums/album_tile_event_handler.dart';
import 'screen/albums/albums_domain_model.dart';
import 'screen/albums/albums_notifier.dart';

final GetIt get = GetIt.instance;

void setupLocator() {
  get.registerFactory(() {
    final options = BaseOptions(baseUrl: 'https://itunes.apple.com');
    return Dio(options);
  });
  get.registerFactory(() => Logger());
  get.registerFactory(() => AlbumRepository(get<Dio>()));

  /// AlbumsScreen
  get.registerSingleton<AlbumsDomainModel>(
    AlbumsDomainModel(get<AlbumRepository>(), get<Logger>()),
  );
  get.registerFactory(() => AlbumsNotifier(get<AlbumsDomainModel>(), get<Logger>()));
  get.registerFactoryParam<AlbumTileEventHandler, BuildContext, void>(
    (context, _) => AlbumTileEventHandler(get<AlbumsDomainModel>(), get<Logger>()),
  );
}
