import 'package:flutter/material.dart';

class AlbumNameText extends StatelessWidget {
  final String? name;

  const AlbumNameText({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      name ?? '',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
