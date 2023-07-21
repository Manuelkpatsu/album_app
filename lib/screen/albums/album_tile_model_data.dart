import 'package:equatable/equatable.dart';

class AlbumTileModelData extends Equatable {
  final int id;
  final String? name;
  final String? thumbnail;
  final double? price;
  final String? currency;
  final bool favorite;

  const AlbumTileModelData({
    this.id = 0,
    this.name,
    this.thumbnail,
    this.price,
    this.currency,
    this.favorite = false,
  });

  AlbumTileModelData copyWith({
    int? id,
    String? name,
    String? thumbnail,
    double? price,
    String? currency,
    bool? favorite,
  }) {
    return AlbumTileModelData(
      id: id ?? this.id,
      name: name ?? this.name,
      thumbnail: thumbnail ?? this.thumbnail,
      price: price ?? this.price,
      currency: currency ?? this.currency,
      favorite: favorite ?? this.favorite,
    );
  }

  @override
  List<Object?> get props => [id, name, thumbnail, price, currency, favorite];
}
