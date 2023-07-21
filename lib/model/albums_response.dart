import 'package:equatable/equatable.dart';

import 'album.dart';

class AlbumsResponse extends Equatable {
  final int resultCount;
  final List<Album> albumList;

  const AlbumsResponse(this.resultCount, this.albumList);

  AlbumsResponse.fromJson(Map<String, dynamic> json)
      : resultCount = json['resultCount'] ?? 0,
        albumList = json['results'] != null
            ? List<Album>.from(json['results'].map((i) => Album.fromJson(i)))
            : [];

  @override
  List<Object?> get props => [resultCount, albumList];
}
