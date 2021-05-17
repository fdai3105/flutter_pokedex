import 'package:get/get.dart';

import '../../data/models/models.dart';
import '../../data/repository/repositories.dart';

class PokemonDetailController extends GetxController {
  final PokemonDetailRepository repository;

  PokemonDetailController({this.repository});

  final _isLoading = true.obs;
  final _pokemon = PokemonDetail().obs;
  final _evolution = Evolution().obs;
  final _species = PokemonSpecies().obs;

  bool get isLoading => _isLoading.value;

  set isLoading(bool value) {
    _isLoading.value = value;
  }

  PokemonDetail get pokemon => _pokemon.value;

  set pokemon(PokemonDetail value) {
    _pokemon.value = value;
  }

  Evolution get evolution => _evolution.value;

  set evolution(Evolution value) {
    _evolution.value = value;
  }

  String get abilities {
    var str = '';
    for (final item in pokemon.abilities) {
      str += '${item.ability.name}, ';
    }
    return str;
  }

  PokemonSpecies get species => _species.value;

  set species(PokemonSpecies value) {
    _species.value = value;
  }

  @override
  Future onInit() async {
    pokemon = Get.arguments['detail'];
    species = await repository.getSpecies(pokemon.id);

    final id = species.evolutionChain.url.split('/');
    evolution = await repository.getEvolution(int.parse(id[id.length - 2]));
    isLoading = false;
    super.onInit();
  }
}
