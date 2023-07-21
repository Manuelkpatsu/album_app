import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FavoriteCountText extends StatelessWidget {
  final ValueListenable<int> favoriteAlbumCount;

  const FavoriteCountText({Key? key, required this.favoriteAlbumCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: favoriteAlbumCount,
      builder: (context, favoriteAlbumCount, child) {
        return Text(
          favoriteAlbumCount.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 10,
          ),
        );
      },
    );
  }
}
