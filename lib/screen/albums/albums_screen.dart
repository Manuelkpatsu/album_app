import 'package:flutter/material.dart';

import '../../../../locator.dart';
import 'albums_notifier.dart';
import 'albums_listenable.dart';
import 'widget/album_list.dart';
import 'widget/app_bar_title_text.dart';
import 'widget/custom_badge.dart';
import 'widget/loading_indicator.dart';

class AlbumsScreen extends StatefulWidget {
  final int artistID;

  const AlbumsScreen({
    Key? key,
    required this.artistID,
  }) : super(key: key);

  @override
  State<AlbumsScreen> createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  late final AlbumsNotifier _notifier;

  @override
  void initState() {
    super.initState();
    _notifier = get<AlbumsNotifier>();
    _notifier.init(widget.artistID);
  }

  @override
  void dispose() {
    _notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitleText(),
        actions: [CustomBadge(favoriteAlbumCount: _notifier.favoriteAlbumCount)],
      ),
      body: Stack(
        children: [
          AlbumList(albumList: _notifier.albumList),
          LoadingIndicator(showLoadingIndicator: _notifier.showLoadingIndicator)
        ],
      ),
    );
  }
}
