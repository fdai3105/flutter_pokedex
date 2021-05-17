import 'package:get/get.dart';

import '../../data/models/models.dart';
import '../../data/repository/repositories.dart';

class PokemonDetailController extends GetxController {
  final PokemonDetailRepository repository;

  PokemonDetailController({this.repository});

  final _pokemon = PokemonDetail().obs;

  PokemonDetail get pokemon => _pokemon.value;

  set pokemon(PokemonDetail value) {
    _pokemon.value = value;
  }

  String get abilities {
    var str = '';
    for (final item in pokemon.abilities) {
      str += '${item.ability.name}, ';
    }
    return str;
  }

  @override
  void onInit() {
    pokemon = Get.arguments['detail'];
    super.onInit();
  }
}
