import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final ValueListenable<bool> showLoadingIndicator;

  const LoadingIndicator({
    Key? key,
    required this.showLoadingIndicator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: showLoadingIndicator,
      builder: (context, show, child) {
        return Visibility(visible: show, child: child!);
      },
      child: const Center(child: CircularProgressIndicator(color: Colors.black)),
    );
  }
}
