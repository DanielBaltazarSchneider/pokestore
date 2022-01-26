import 'dart:convert';

import 'package:pokestore/models/Pokemon/Description.dart';
import 'package:pokestore/useful/config/endpoints.dart';
import 'package:pokestore/useful/http/http.dart';

import 'Pokemon.dart';

class PokemonRepository {
  // Return pokemon
  static Future<List<Pokemon>> getIntervalPokemon(int offset, int limit) async {
    var url = "${Endpoint.pokeapi}/pokemon/?offset=$offset&limit=$limit";
    // print(url);
    HttpStatus httpStatus = await Http().getHttp(url);
    // print(httpStatus.body);
    if (httpStatus.status) {
      try {
        List res = jsonDecode(httpStatus.body)['results'];
        return pokemonFromJson(jsonEncode(res));
      } catch (e) {
        return [];
      }
    } else {
      return [];
    }
  }

  static Future<Description?> getDescriptionPokemon(String url) async {
    HttpStatus httpStatus = await Http().getHttp(url);
    if (httpStatus.status) {
      //List res = jsonDecode(httpStatus.body);
      return descriptionFromJson(httpStatus.body);
      // try {
      //   List res = jsonDecode(httpStatus.body);
      //   return descriptionFromJson(jsonEncode(res));
      // } catch (e) {
      //   print("error - " + e.toString());
      //   return null;
      // }
    } else {
      return null;
    }
  }
}
