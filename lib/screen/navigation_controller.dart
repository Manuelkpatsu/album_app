import 'package:flutter/material.dart';

class NavigationController {
  final BuildContext _context;

  NavigationController(this._context);

  void showSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(_context).showSnackBar(snackBar);
  }
}
