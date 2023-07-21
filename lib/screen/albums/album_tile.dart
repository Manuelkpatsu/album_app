import 'dart:async';

import 'package:flutter/material.dart';

import '../../../locator.dart';
import 'album_tile_event.dart';
import 'album_tile_event_handler.dart';
import 'album_tile_model_data.dart';
import 'widget/album_currency_text.dart';
import 'widget/album_name_text.dart';
import 'widget/album_price_text.dart';
import 'widget/album_thumbnail.dart';
import 'widget/favorite_button.dart';

class AlbumTile extends StatefulWidget {
  final AlbumTileModelData modelData;

  AlbumTile(this.modelData, {Key? key}) : super(key: ValueKey(modelData.id));

  @override
  State<AlbumTile> createState() => _AlbumTileState();
}

class _AlbumTileState extends State<AlbumTile> {
  final _eventController = StreamController<AlbumTileEvent>();
  late final AlbumTileEventHandler _eventHandler;

  @override
  void initState() {
    super.initState();
    _eventHandler = get<AlbumTileEventHandler>(param1: context);
    _eventHandler.init(_eventController);
  }

  @override
  void dispose() {
    _eventHandler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final modelData = widget.modelData;

    return ListTile(
      leading: AlbumThumbnail(thumbnail: modelData.thumbnail),
      title: AlbumNameText(name: modelData.name),
      subtitle: Row(
        children: [
          AlbumCurrencyText(currency: modelData.currency),
          const SizedBox(width: 5),
          AlbumPriceText(price: modelData.price),
        ],
      ),
      trailing: FavoriteButton(
        favorite: modelData.favorite,
        onPressed: () {
          _eventController.add(FavoriteEvent(modelData.id, !modelData.favorite));
        },
      ),
    );
  }
}
