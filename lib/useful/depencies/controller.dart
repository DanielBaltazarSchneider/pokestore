import 'package:pokestore/useful/depencies/inject.dart';
import 'package:pokestore/useful/navigation/Nav.dart';

class PokeController {
  static MyInjection go = MyInjection.of(Nav.context);

  static final PokeController _singleton = PokeController._internal();

  factory PokeController() {
    return _singleton;
  }

  PokeController._internal();
}
