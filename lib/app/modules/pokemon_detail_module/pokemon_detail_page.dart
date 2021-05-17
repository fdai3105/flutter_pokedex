import 'package:flutter/material.dart';
import 'package:flutter_pokedex/app/modules/pokemon_detail_module/pokemon_detail_controller.dart';
import 'package:flutter_pokedex/app/widgets/widget_appbar.dart';
import 'package:get/get.dart';

class PokemonDetailPage extends GetWidget<PokemonDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetAppBar(
        title: '',
      ),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}