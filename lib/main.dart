import 'package:flutter/material.dart';

import 'locator.dart';
import 'screen/albums/albums_screen.dart';
import 'theme/custom_theme.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test App',
      theme: CustomTheme.theme,
      home: const AlbumsScreen(artistID: 909253),
    );
  }
}
