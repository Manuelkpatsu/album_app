import 'package:flutter/material.dart';

class AlbumThumbnail extends StatelessWidget {
  final String? thumbnail;

  const AlbumThumbnail({Key? key, required this.thumbnail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: thumbnail != null
          ? Image.network(
              thumbnail!,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
              colorBlendMode: BlendMode.darken,
              color: Colors.black12,
            )
          : Image.asset(
              'assets/images/spotify.png',
              width: 60,
              height: 60,
              fit: BoxFit.contain,
              colorBlendMode: BlendMode.darken,
              color: Colors.black12,
            ),
    );
  }
}
