import 'package:flutter/cupertino.dart';
import 'package:flutter_pokedex/app/data/models/models.dart';
import 'package:flutter_pokedex/app/data/provider/pokemon_provider.dart';

class PokemonRepository {
  final PokemonProvider provider;

  PokemonRepository({@required this.provider}) : assert(provider != null, '');

  Future<Pokemon> getPokemon(int offset, int limit) async {
    final rp = await provider.getPokemon(offset, limit ?? 50);
    if (rp.isOk) {
      return Pokemon.fromJson(rp.body);
    }
    return null;
  }
}
