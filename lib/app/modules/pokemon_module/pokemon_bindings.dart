import 'package:flutter_pokedex/app/data/provider/pokemon_detail_provider.dart';
import 'package:flutter_pokedex/app/data/provider/pokemon_provider.dart';
import 'package:flutter_pokedex/app/data/repository/pokemon_detail_repository.dart';
import 'package:flutter_pokedex/app/data/repository/pokemon_repository.dart';
import 'package:flutter_pokedex/app/modules/pokemon_module/pokemon_controller.dart';
import 'package:get/get.dart';

class PokemonBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => PokemonController(
        repository: PokemonRepository(provider: PokemonProvider()),
        pokemonDetailRepository: PokemonDetailRepository(
          provider: PokemonDetailProvider(),
        ),
      ),
    );
  }
}
