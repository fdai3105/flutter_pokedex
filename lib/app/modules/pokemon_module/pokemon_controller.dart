import 'package:get/get.dart';

import '../../data/models/models.dart';
import '../../data/repository/repositories.dart';

class PokemonController extends GetxController {
  final PokemonRepository repository;
  final PokemonDetailRepository pokemonDetailRepository;

  PokemonController({this.repository, this.pokemonDetailRepository});

  final _isLoading = true.obs;
  final _offset = 0.obs;
  final _pokemon = <PokemonDetail>[].obs;

  bool get isLoading => _isLoading.value;

  set isLoading(bool value) {
    _isLoading.value = value;
  }

  int get offset => _offset.value;

  set offset(int value) {
    _offset.value = value;
  }

  List<PokemonDetail> get pokemon => _pokemon.value;

  set pokemon(List<PokemonDetail> value) {
    _pokemon.value = value;
  }

  @override
  Future onInit() async {
    final pokeRp = await repository.getPokemon(offset, null);
    await Future.forEach(pokeRp.results, (element) async {
      pokemon.add(await pokemonDetailRepository.getPokemonDetail(element.name));
    });
    isLoading = false;
    super.onInit();
  }
}
