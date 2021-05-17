import '../../utils/strings.dart';
import 'package:get/get_connect/connect.dart';

class PokemonProvider extends GetConnect {
  Future<Response> getPokemon(int offset, int limit) => get(
        '$domainUrl/pokemon?limit=50&offset=$offset',
      );

  Future<Response> getPokemonDetail(int id) => get('$domainUrl/pokemon/$id');
}
