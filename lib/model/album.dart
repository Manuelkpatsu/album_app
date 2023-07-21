import 'package:equatable/equatable.dart';

class Album extends Equatable {
  final int? collectionId;
  final String? collectionName;
  final String? artworkUrl100;
  final double? collectionPrice;
  final String? currency;

  const Album(
    this.collectionId,
    this.collectionName,
    this.artworkUrl100,
    this.collectionPrice,
    this.currency,
  );

  Album.fromJson(Map<String, dynamic> json)
      : collectionId = json['collectionId'],
        collectionName = json['collectionName'],
        artworkUrl100 = json['artworkUrl100'],
        collectionPrice = json['collectionPrice'],
        currency = json['currency'];

  @override
  List<Object?> get props => [
        collectionId,
        collectionName,
        artworkUrl100,
        collectionPrice,
        currency,
      ];
}
