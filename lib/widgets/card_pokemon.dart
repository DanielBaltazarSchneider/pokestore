import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pokestore/models/Pokemon/Pokemon.dart';
import 'package:pokestore/useful/extension/String/MyString.dart';
import 'package:pokestore/useful/extension/double/MyDouble.dart';

class CardPokemon extends StatelessWidget {
  const CardPokemon({Key? key, required this.pokemon, required this.width, required this.onTapBuy, required this.onTapFavorite}) : super(key: key);

  final Pokemon pokemon;
  final double width;
  final Function onTapBuy;
  final Function onTapFavorite;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          child: Container(
            // margin: EdgeInsets.all(5),
            padding: EdgeInsets.only(left: 35, right: 35, top: 15, bottom: 15),
            decoration: BoxDecoration(
              // border: Border.all(color: pokemon.amount <= 0 ? Colors.red : Colors.black),
              // borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade100,
            ),
            child: Column(
              children: [
                FittedBox(
                  child: Text(
                    "${pokemon.name}".toFirthUpperCase(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                if (pokemon.description != null) ...[
                  Image.network(pokemon.description!.sprites.frontDefault),
                ],
                SizedBox(height: 5),
                Container(
                  width: 110,
                  decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: [
                      Container(
                        height: 7,
                        width: pokemon.description!.baseExperience * 110 / 700,
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),
                Text(
                  "Exp: ${pokemon.description!.baseExperience} de 700",
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                ),
                SizedBox(height: 10),
                Wrap(
                  children: [
                    Text(
                      r"R$ ",
                    ),
                    Text(
                      (pokemon.description!.baseExperience * 1.33).toFormat0_00(),
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
                if (pokemon.amount <= 0) ...[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Indisponível",
                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ),
                ] else ...[
                  TextButton(
                    onPressed: () => onTapBuy(),
                    child: Text("Adicionar"),
                  ),
                ],
                Text(
                  "Disponível ${pokemon.amount}",
                  style: TextStyle(fontSize: 10, color: pokemon.amount <= 0 ? Colors.red : Colors.black),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            right: 10,
            top: 10,
            child: InkWell(
              onTap: () => onTapFavorite(),
              child: pokemon.favorite
                  ? Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : Icon(Icons.favorite_border),
            )),
      ],
    );
  }
}
