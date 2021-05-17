import 'package:flutter_pokedex/app/data/repository/pokemon_detail_repository.dart';
import 'package:get/get.dart';

class PokemonDetailController extends GetxController{

  final PokemonDetailRepository repository;

  PokemonDetailController({this.repository});
}
