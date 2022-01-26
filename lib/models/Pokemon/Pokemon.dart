// To parse this JSON data, do
//
//     final pokemon = pokemonFromJson(jsonString);

import 'dart:convert';

import 'package:pokestore/models/Pokemon/Description.dart';

List<Pokemon> pokemonFromJson(String str) => List<Pokemon>.from(json.decode(str).map((x) => Pokemon.fromJson(x)));

String pokemonToJson(List<Pokemon> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pokemon {
  Pokemon({required this.name, required this.url, this.description});

  final String name;
  final String url;
  int amount = 10;
  bool favorite = false;
  Description? description;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
