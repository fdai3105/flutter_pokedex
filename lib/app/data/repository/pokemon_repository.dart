import 'package:flutter/material.dart';

import '../models/models.dart';
import '../provider/providers.dart';

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
