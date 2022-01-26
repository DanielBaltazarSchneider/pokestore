import 'dart:async';

import 'package:pokestore/models/Pokemon/Pokemon.dart';
import 'package:pokestore/models/store/cart.dart';
import 'package:pokestore/useful/depencies/controller.dart';
import 'package:pokestore/useful/navigation/Nav.dart';

class CartController {
  CartController() {
    cartPokemonController.add(Cart());
    this.cart = PokeController.go.cart;
    initState();
  }

  StreamController<Cart> cartPokemonController = StreamController<Cart>();
  Cart cart = Cart();
  List<Pokemon> removedPokemon = [];

  initState() {
    cartPokemonController.add(cart);
    print(cart.listPokemon.length);
  }

  void cartRemovePokemon(int index) {
    removedPokemon.add(cart.listPokemon[index]);
    cart.listPokemon.removeAt(index);
    cartPokemonController.add(cart);
  }

  void cartRemoveAllPokemon() {
    removedPokemon = cart.listPokemon;
    cart.listPokemon = [];
    cartPokemonController.add(cart);
  }

  void returnPage() {
    Nav.previous(result: {"cart": cart, "listRemoved": removedPokemon});
  }
}
