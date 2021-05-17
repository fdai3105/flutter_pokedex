import 'package:flutter_pokedex/app/modules/pokemon_detail_module/pokemon_detail_controller.dart';
import 'package:flutter_pokedex/app/data/provider/pokemon_detail_provider.dart';
import 'package:flutter_pokedex/app/data/repository/pokemon_detail_repository.dart';
import 'package:get/get.dart';

class PokemonDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PokemonDetailController(repository: PokemonDetailRepository(provider: PokemonDetailProvider())));
  }
}