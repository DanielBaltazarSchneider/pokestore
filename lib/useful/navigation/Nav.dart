import 'package:flutter/material.dart';
import 'package:pokestore/main.dart';

class Nav {
  static BuildContext context = navigatorKey.currentContext!;

  static dynamic to(dynamic page) async {
    return await Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (c, a1, a2) => page,
        transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
        transitionDuration: Duration(milliseconds: 500),
      ),
    );
  }

  static dynamic off({dynamic page}) {
    return Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
          pageBuilder: (c, a1, a2) => page,
          transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
          transitionDuration: Duration(milliseconds: 500),
        ),
        (Route<dynamic> route) => false);
  }

  static dynamic offAll({dynamic page}) {
    return Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(
          pageBuilder: (c, a1, a2) => page,
          transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
          transitionDuration: Duration(milliseconds: 500)),
      (route) => false,
    );
  }

  static void previous({dynamic result}) {
    navigatorKey.currentState!.pop(result);
  }
}
