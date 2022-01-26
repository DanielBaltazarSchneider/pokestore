import 'package:flutter/material.dart';
import 'package:pokestore/models/Pokemon/Pokemon.dart';
import 'package:pokestore/models/store/cart.dart';
import 'package:pokestore/useful/extension/String/MyString.dart';
import 'package:pokestore/useful/extension/double/MyDouble.dart';
import 'package:pokestore/views/cart/cart_controller.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = CartController();
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Carrinho"),
          leading: Container(),
          leadingWidth: 0,
          actions: [
            IconButton(
              onPressed: () => cartController.returnPage(),
              icon: Icon(Icons.close),
            )
          ],
        ),
        body: StreamBuilder<Cart>(
          stream: cartController.cartPokemonController.stream,
          builder: (context, snapshot) {
            Cart cart = snapshot.data ?? Cart();
            List<Pokemon> listCartPokemon = cart.listPokemon;
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    for (int i = 0; i < listCartPokemon.length; i++) ...[
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Image.network(listCartPokemon[i].description!.sprites.frontDefault),
                                Text("${cart.listPokemon[i].name}".toFirthUpperCase()),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(r" R$ " + "${(listCartPokemon[i].description!.baseExperience * 1.33).toFormat0_00()}"),
                          ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              // onPressed: () => removePokemon(i),
                              onPressed: () => cartController.cartRemovePokemon(i),
                              icon: Icon(Icons.remove_circle_sharp),
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                    ],
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Text(
                            "Total: ",
                            style: TextStyle(fontSize: 22),
                          ),
                          Expanded(child: Container()),
                          Text(
                            r" R$ " + "${cart.value().toFormat0_00()}",
                            style: TextStyle(fontSize: 22),
                          ),
                        ],
                      ),
                    ),
                    if (cart.listPokemon.length != 0) ...[
                      ElevatedButton(
                        onPressed: () => null,
                        child: Text("Ir para o pagamento"),
                      ),
                      TextButton(onPressed: () => cartController.cartRemoveAllPokemon(), child: Text("Esvaziar carrinho"))
                    ]
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
