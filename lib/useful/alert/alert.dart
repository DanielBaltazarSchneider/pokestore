import 'package:flutter/material.dart';
import 'package:pokestore/useful/navigation/Nav.dart';
import 'package:pokestore/useful/responsive/responsive.dart';

class Alert {
  static void show({required Widget child}) {
    showDialog<String>(
      context: Nav.context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) => AlertDialog(
            insetPadding: EdgeInsets.all(5),
            scrollable: false,
            content: Container(
              // color: Colors.grey,
              width: Responsive.width,
              // height: Responsive.height,
              child: child,
            ),
          ),
        );
      },
    );
  }
}
