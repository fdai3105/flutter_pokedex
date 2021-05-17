import 'package:flutter/cupertino.dart';
import 'package:flutter_pokedex/app/data/models/pokemon_detail.dart';
import 'package:flutter_pokedex/app/data/provider/pokemon_detail_provider.dart';

class PokemonDetailRepository {
  final PokemonDetailProvider provider;

  PokemonDetailRepository({@required this.provider})
      : assert(provider != null, '');

  Future<PokemonDetail> getPokemonDetail(String name) async {
    final rp = await provider.getPokemonDetail(name);
    if (rp.isOk) {
      return PokemonDetail.fromJson(rp.body);
    }
    return null;
  }
}
