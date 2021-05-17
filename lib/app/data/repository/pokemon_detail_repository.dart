import 'package:flutter/material.dart';

import '../models/models.dart';
import '../provider/pokemon_detail_provider.dart';

class PokemonDetailRepository {
  final PokemonDetailProvider provider;

  PokemonDetailRepository({@required this.provider});

  Future<PokemonDetail> getPokemonDetail(String name) async {
    final rp = await provider.getPokemonDetail(name);
    if (rp.isOk) {
      return PokemonDetail.fromJson(rp.body);
    }
    return null;
  }
}
