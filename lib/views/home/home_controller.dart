import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokestore/models/Pokemon/Description.dart';
import 'package:pokestore/models/Pokemon/Pokemon.dart';
import 'package:pokestore/models/Pokemon/pokemon_repository.dart';
import 'package:pokestore/models/store/cart.dart';
import 'package:pokestore/useful/extension/String/MyString.dart';
import 'package:pokestore/useful/snack_bar/MySnackBar.dart';

class HomeController {
  static final HomeController _singleton = HomeController._internal();

  // Streams
  StreamController<List<Pokemon>> controllerListPokemon = StreamController<List<Pokemon>>.broadcast();
  StreamController<Cart> controllerCartPokemon = StreamController<Cart>.broadcast();
  StreamController<bool> isLoading = StreamController<bool>.broadcast();

  // variables
  ScrollController scrollController = ScrollController();
  int currentDownloadPokemon = 22;
  int limit = 22;
  bool loading = false;
  List<Pokemon> listPokemon = [];
  List<Pokemon> listCartPokemon = [];
  Cart cart = Cart();

  // singleton
  factory HomeController() {
    return _singleton;
  }

  // constructor singleton
  HomeController._internal() {
    controllerListPokemon.add([]);
    isLoading.add(false);

    initController();
    mergeDescriptionPokemon();
    print("Home Controller initialized");
    scrollController.addListener(() async {
      if (!loading) {
        if (scrollController.position.extentAfter < 2000) {
          if (currentDownloadPokemon < 1119) {
            await getApiPokemon();
          }
        }
      }
    });
  }

  Future<void> initController() async {
    await returnListPokemon();
    await mergeDescriptionPokemon();
  }

  Future<void> returnListPokemon() async {
    loading = true;
    isLoading.add(true);
    listPokemon = await PokemonRepository.getIntervalPokemon(0, currentDownloadPokemon);
    print("Pokemons retornados: " + listPokemon.length.toString());
    //MyInjection.of(Nav.context).homeController.listPokemon = listPokemon;
  }

  Future<Description?> returnDescriptionPokemon(Pokemon pokemon) async {
    Description? description = await PokemonRepository.getDescriptionPokemon(pokemon.url);
    //print(description == null ? "${pokemon.name} - " : description.name);
    return description;
  }

  mergeDescriptionPokemon() async {
    for (int i = 0; i < listPokemon.length; i++) {
      if (listPokemon[i].description == null) {
        listPokemon[i].description = await returnDescriptionPokemon(listPokemon[i]);
      } else {
        print("$i - ${listPokemon[i].name} - OK");
      }
    }
    controllerListPokemon.add(listPokemon);
    isLoading.add(false);
    loading = false;
  }

  Future<void> getApiPokemon() async {
    isLoading.add(true);
    loading = true;
    print("add de $currentDownloadPokemon até ${currentDownloadPokemon + limit}");
    listPokemon += await PokemonRepository.getIntervalPokemon(currentDownloadPokemon + limit, limit);
    currentDownloadPokemon += limit;
    await mergeDescriptionPokemon();
  }

  void addPokemonCart(int index) {
    if (listPokemon[index].amount <= 0) {
    } else {
      cart.listPokemon.add(listPokemon[index]);
      listPokemon[index].amount -= 1;
      controllerListPokemon.add(listPokemon);
      controllerCartPokemon.add(cart);
      MySnackBar.show(
        child: Text(
          "${listPokemon[index].name.toFirthUpperCase()} adicionado",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green,
      );
    }
  }

  void setFavoritePokemon(int i) {
    listPokemon[i].favorite = !listPokemon[i].favorite;
    controllerListPokemon.add(listPokemon);
  }

  void updateCart(Map cartReturn) {
    this.cart = cartReturn['cart'];
    List<Pokemon> listRemovedPokemon = cartReturn['listRemoved'];
    for (int i = 0; i < listPokemon.length; i++) {
      for (int a = 0; a < listRemovedPokemon.length; a++) {
        if (listPokemon[i].name == listRemovedPokemon[a].name) {
          listPokemon[i].amount++;
        }
      }
    }
    controllerCartPokemon.add(cart);
    controllerListPokemon.add(listPokemon);
  }
}
