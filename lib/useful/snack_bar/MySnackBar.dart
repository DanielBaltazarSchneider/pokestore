import 'package:flutter/material.dart';
import 'package:pokestore/useful/navigation/Nav.dart';

class MySnackBar {
  static show({required Widget child, Color backgroundColor = Colors.white}) {
    ScaffoldMessenger.of(Nav.context).showSnackBar(
      SnackBar(
        content: child,
        backgroundColor: backgroundColor,
        duration: Duration(milliseconds: 1500),
        elevation: 10,
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
