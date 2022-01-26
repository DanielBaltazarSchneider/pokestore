import 'package:flutter/material.dart';
import 'package:pokestore/useful/depencies/inject.dart';
import 'package:pokestore/views/home/home_view.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

void main() {
  runApp(
    MyInjection(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Gerenciamento de rotas",
        home: HomeView(),
        navigatorKey: navigatorKey,
      ),
    ),
  );
}
