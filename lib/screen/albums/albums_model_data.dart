import 'package:equatable/equatable.dart';

import 'album_tile_model_data.dart';

class AlbumsModelData extends Equatable {
  final List<AlbumTileModelData> albumTileModelDataList;
  final bool loading;

  const AlbumsModelData({
    this.albumTileModelDataList = const [],
    this.loading = false,
  });

  AlbumsModelData copyWith({
    List<AlbumTileModelData>? albumTileModelDataList,
    bool? loading,
  }) {
    return AlbumsModelData(
      albumTileModelDataList: albumTileModelDataList ?? this.albumTileModelDataList,
      loading: loading ?? this.loading,
    );
  }

  @override
  List<Object?> get props => [albumTileModelDataList, loading];
}
