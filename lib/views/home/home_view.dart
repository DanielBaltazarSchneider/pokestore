import 'package:flutter/material.dart';
import 'package:pokestore/models/Pokemon/Pokemon.dart';
import 'package:pokestore/models/store/cart.dart';
import 'package:pokestore/useful/depencies/controller.dart';
import 'package:pokestore/useful/navigation/Nav.dart';
import 'package:pokestore/views/cart/cart_view.dart';
import 'package:pokestore/views/home/home_controller.dart';
import 'package:pokestore/widgets/card_pokemon.dart';
import 'package:pokestore/widgets/mobile_app_bar.dart';
import 'package:pokestore/widgets/web_app_bar.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar();
    final home = HomeController();

    return LayoutBuilder(
      builder: (context, constrains) {
        double width = constrains.maxWidth;
        return WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: width < 700
                ? PreferredSize(
                    preferredSize: Size(width, appBar.preferredSize.height),
                    child: StreamBuilder<Cart>(
                        stream: home.controllerCartPokemon.stream,
                        builder: (context, snapshot) {
                          Cart cart = snapshot.data ?? Cart();
                          List<Pokemon> listCartPokemon = cart.listPokemon;
                          return MobileAppBar(
                            appBarHeight: appBar.preferredSize.height,
                            totalItemsCard: listCartPokemon.length,
                            onCardClick: () async {
                              PokeController.go.cart = home.cart;
                              Map cartReturn = await Nav.to(CartView());
                              home.updateCart(cartReturn);
                            },
                          );
                        }),
                  )
                : PreferredSize(
                    preferredSize: Size(width, appBar.preferredSize.height),
                    child: StreamBuilder(
                        stream: home.controllerCartPokemon.stream,
                        builder: (context, snapshot) {
                          Cart cart = (snapshot.data ?? Cart()) as Cart;
                          List<Pokemon> listCartPokemon = cart.listPokemon;
                          return WebAppBar(
                            appBarHeight: appBar.preferredSize.height,
                            totalItemsCard: listCartPokemon.length,
                            onCardClick: () async {
                              PokeController.go.cart = home.cart;
                              Map cartReturn = await Nav.to(CartView());
                              home.updateCart(cartReturn);
                            },
                          );
                        }),
                  ),
            body: Center(
              child: Container(
                width: width < 700 ? width : 700,
                child: Scrollbar(
                  controller: home.scrollController,
                  isAlwaysShown: true,
                  child: SingleChildScrollView(
                    controller: home.scrollController,
                    child: Container(
                      width: width,
                      child: StreamBuilder(
                          stream: home.controllerListPokemon.stream,
                          builder: (context, snapshot) {
                            List<Pokemon> listPokemon = [];
                            listPokemon = (snapshot.data ?? <Pokemon>[]) as List<Pokemon>;
                            return Wrap(
                              alignment: WrapAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: width,
                                  padding: EdgeInsets.all(25),
                                  child: Center(
                                      child: Text(
                                    "Super ofertas\nOs melhores Pokemons com o menor preço",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                  )),
                                ),
                                for (int i = 0; i < listPokemon.length; i++) ...[
                                  CardPokemon(
                                    pokemon: listPokemon[i],
                                    width: width,
                                    onTapBuy: () => home.addPokemonCart(i),
                                    onTapFavorite: () => home.setFavoritePokemon(i),
                                  ),
                                ],
                                StreamBuilder(
                                    stream: home.isLoading.stream,
                                    builder: (context, snapshot) {
                                      bool isLoading = (snapshot.data ?? false) as bool;
                                      if (isLoading) {
                                        return Padding(
                                          padding: EdgeInsets.all(20.0),
                                          child: Container(
                                            width: width,
                                            child: Center(child: CircularProgressIndicator()),
                                          ),
                                        );
                                      } else {
                                        return Container();
                                      }
                                    }),
                              ],
                            );
                          }),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
