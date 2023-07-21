import 'package:flutter/material.dart';

abstract class AlbumTileEvent {}

@immutable
class FavoriteEvent extends AlbumTileEvent {
  final int albumID;
  final bool favorite;

  FavoriteEvent(this.albumID, this.favorite);
}
