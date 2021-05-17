import 'package:get/get_connect/connect.dart';

import '../../utils/strings.dart';

class PokemonDetailProvider extends GetConnect {
  Future<Response> getPokemonDetail(String name) =>
      get('$domainUrl/pokemon/$name');

  Future<Response> getEvolution(int id) =>
      get('$domainUrl/evolution-chain/$id');

  Future<Response> getSpecies(int id) => get('$domainUrl/pokemon-species/$id');
}
