import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/widgets.dart';
import 'pokemon_controller.dart';
import 'widgets/widget_item.dart';

class PokemonPage extends GetWidget<PokemonController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const WidgetAppBar(title: 'Pokemon'),
      body: SafeArea(
        child: GetX<PokemonController>(
          builder: (_) {
            if (controller.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.6,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: controller.pokemon.length,
              itemBuilder: (context, i) {
                final item = controller.pokemon[i];
                return WidgetItem(
                  id: item.id,
                  name: item.name,
                  types: item.types,
                );
              },
            ).marginOnly(top: 10);
          },
        ),
      ),
    );
  }
}
