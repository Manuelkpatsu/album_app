import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

import 'favorite_count_text.dart';

class CustomBadge extends StatelessWidget {
  final ValueListenable<int> favoriteAlbumCount;

  const CustomBadge({Key? key, required this.favoriteAlbumCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 20,
      onPressed: () {},
      icon: badges.Badge(
        badgeContent: FavoriteCountText(favoriteAlbumCount: favoriteAlbumCount),
        position: badges.BadgePosition.topEnd(top: -8, end: -5),
        badgeAnimation: const badges.BadgeAnimation.rotation(
          animationDuration: Duration(seconds: 1),
          colorChangeAnimationDuration: Duration(seconds: 1),
          loopAnimation: false,
          curve: Curves.fastOutSlowIn,
          colorChangeAnimationCurve: Curves.easeInCubic,
        ),
        badgeStyle: const badges.BadgeStyle(
          shape: badges.BadgeShape.circle,
          badgeColor: Colors.red,
          padding: EdgeInsets.all(5),
          elevation: 0,
        ),
        child: const Icon(Icons.favorite_border, color: Colors.black),
      ),
    );
  }
}
