import 'package:pokestore/models/Pokemon/Pokemon.dart';

class Cart {
  Cart();
  List<Pokemon> listPokemon = [];
  double amountCart = 0.0;

  double value() {
    double total = 0.0;
    for (Pokemon pokemon in this.listPokemon) {
      total += pokemon.description!.baseExperience * 1.33;
    }
    return total;
  }
}
