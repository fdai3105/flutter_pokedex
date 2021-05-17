import '../../utils/strings.dart';
import 'package:get/get_connect/connect.dart';

class PokemonDetailProvider extends GetConnect {
  Future<Response> getPokemonDetail(String name) => get('$domainUrl/pokemon/$name');
}
