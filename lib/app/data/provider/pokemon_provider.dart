import 'package:get/get_connect/connect.dart';

import '../../utils/strings.dart';

class PokemonProvider extends GetConnect {
  Future<Response> getPokemon(int offset, int limit) => get(
        '$domainUrl/pokemon?limit=50&offset=$offset',
      );

  Future<Response> getPokemonDetail(int id) => get('$domainUrl/pokemon/$id');
}
