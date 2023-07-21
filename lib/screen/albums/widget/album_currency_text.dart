import 'package:flutter/material.dart';

class AlbumCurrencyText extends StatelessWidget {
  final String? currency;

  const AlbumCurrencyText({Key? key, required this.currency}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(currency ?? '');
  }
}
