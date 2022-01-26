import 'package:flutter/material.dart';

import '../../main.dart';

class Responsive {
  static BuildContext _context = navigatorKey.currentContext!;
  static double width = MediaQuery.of(_context).size.width;
  static double height = MediaQuery.of(_context).size.height;
  static double paddingTop = MediaQuery.of(_context).padding.top;
}
