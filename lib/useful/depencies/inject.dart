import 'package:flutter/material.dart';
import 'package:pokestore/models/store/cart.dart';

//ignore: must_be_immutable
class MyInjection extends InheritedWidget {
  MyInjection({Key? key, required this.child}) : super(key: key, child: child);
  final Widget child;

  ///Inject where your dependency
  Cart cart = Cart();

  static MyInjection of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<MyInjection>() as MyInjection);
  }

  @override
  bool updateShouldNotify(MyInjection oldWidget) {
    return true;
  }
}
