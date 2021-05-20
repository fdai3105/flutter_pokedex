import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/models.dart';
import '../../utils/utils.dart';
import '../../widgets/widgets.dart';
import 'pokemon_detail.dart';

part 'widgets/widget_evolution_item.dart';

part 'widgets/widget_poke_ball.dart';

part 'widgets/widget_stat_bar.dart';

part 'widgets/widget_stat_item.dart';

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
                    Positioned(
                      top: -60,
                      left: -60,
                      child: Transform.rotate(
                        angle: 1.4,
                        child: Container(
                          height: 140,
                          width: 140,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: const FractionalOffset(0, 0),
                              end: const FractionalOffset(1, 1),
                              colors: [
                                Colors.white24,
                                Colors.white.withOpacity(0),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -110,
                      left: 0,
                      right: 0,
                      child: WidgetPokeBall(),
                    ),
                    Positioned(
                      top: -30,
                      right: 30,
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Image.asset(
                          'assets/images/dotted.png',
                          color: Colors.white24,
                          height: 60,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(height: kToolbarHeight + 30),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.pokemon.name.capitalizeFirst,
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
                              top: Radius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Hero(
                      tag: 'image_${controller.pokemon.id}',
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: WidgetImagePokemon(
                          id: controller.pokemon.id,
                          height: 200,
                          width: 200,
                        ),
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
                    TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.black54,
                      indicatorColor: colorByType(
                        controller.pokemon.types.first.type.name,
                      ),
                      tabs: const [
                        Tab(text: 'About'),
                        Tab(text: 'Base Stats'),
                        Tab(text: 'Evolution'),
                        Tab(text: 'Moves'),
                      ],
                    ),
                    Expanded(
                      child: GetX<PokemonDetailController>(
                        builder: (_) {
                          if (controller.isLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return TabBarView(
                              children: [
                                _about(),
                                _stats(),
                                _evolution(),
                                _moves(),
                              ],
                            );
                          }
                        },
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
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          _WidgetStatItem(
              name: 'Species', sub: controller.pokemon.species.name),
          _WidgetStatItem(
            name: 'Height',
            sub: controller.pokemon.height.toString(),
          ),
          _WidgetStatItem(
            name: 'Weight',
            sub: controller.pokemon.weight.toString(),
          ),
          _WidgetStatItem(
            name: 'Abilities',
            sub: controller.abilities,
          ),
        ],
      ),
    );
  }

  Widget _stats() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: _WidgetStatBar(stats: controller.pokemon.stats),
    );
  }

  Widget _evolution() {
    final second = controller.evolution.chain.evolvesTo;
    final secondID = second.first.species.url.split('/');
    final three = second.first.evolvesTo;
    final threeID = three.first.species.url.split('/');

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          _WidgetEvolutionItem(
            name: controller.evolution.chain.species.name,
            id: int.parse(controller.evolution.chain.species.url.split('/')[6]),
            secondID: int.parse(secondID[secondID.length - 2]),
            secondName: second.first.species.name,
            level: second.first.evolutionDetails.first.minLevel,
          ),
          _WidgetEvolutionItem(
            name: second.first.species.name,
            id: int.parse(secondID[secondID.length - 2]),
            secondName: three.first.species.name,
            secondID: int.parse(threeID[threeID.length - 2]),
            level: three.first.evolutionDetails.first.minLevel,
          ),
        ],
      ),
    );
  }

  Widget _moves() {
    return SizedBox();
  }
}
