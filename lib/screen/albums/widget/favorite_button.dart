import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  final bool favorite;
  final GestureTapCallback? onPressed;

  const FavoriteButton({Key? key, required this.favorite, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 20,
      icon: Icon(
        favorite ? Icons.favorite : Icons.favorite_border,
        color: favorite ? Colors.red : Colors.black,
      ),
      onPressed: onPressed,
    );
  }
}
