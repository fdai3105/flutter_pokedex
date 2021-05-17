import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/app/modules/pokemon_detail_module/widgets/widget_stat_number.dart';
import 'package:flutter_pokedex/app/modules/pokemon_detail_module/widgets/widgets.dart';
import 'package:flutter_pokedex/app/utils/utlis.dart';
import 'package:flutter_pokedex/app/widgets/widgets.dart';
import 'package:get/get.dart';

import 'pokemon_detail.dart';

class PokemonDetailPage extends GetWidget<PokemonDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: Colors.white,
      appBar: const WidgetAppBar(background: Colors.transparent),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Flexible(
              child: Container(
                color: colorByType(controller.pokemon.types.first.type.name),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(height: kToolbarHeight + 20),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.pokemon.name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                WidgetChipType(
                                  types: controller.pokemon.types,
                                  axis: Axis.horizontal,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://static.pokemonpets.com/images/monsters-images-300-300/${controller.pokemon.id}-${controller.pokemon.name}.png',
                        height: 200,
                        width: 200,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: DefaultTabController(
                length: 4,
                child: Column(
                  children: [
                    const TabBar(
                      labelColor: Colors.black,
                      tabs: [
                        Tab(text: 'About'),
                        Tab(text: 'Base Stats'),
                        Tab(text: 'Evolution'),
                        Tab(text: 'Moves'),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          right: 10,
                          left: 10,
                        ),
                        child: TabBarView(
                          children: [
                            _about(),
                            _stats(),
                            _about(),
                            _about(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _about() {
    return Column(
      children: [
        WidgetStatItem(name: 'Species', sub: controller.pokemon.species.name),
        WidgetStatItem(
          name: 'Height',
          sub: controller.pokemon.height.toString(),
        ),
        WidgetStatItem(
          name: 'Weight',
          sub: controller.pokemon.weight.toString(),
        ),
        WidgetStatItem(
          name: 'Abilities',
          sub: controller.abilities,
        ),
      ],
    );
  }

  Widget _stats() {
    return WidgetStatNumber(stats: controller.pokemon.stats);
  }

  Widget _evolution() {}

  Widget _movies() {}
}

