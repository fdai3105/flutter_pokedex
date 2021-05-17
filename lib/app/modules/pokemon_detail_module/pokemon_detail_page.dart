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
              child: GetX<PokemonDetailController>(
                builder: (_) {
                  return DefaultTabController(
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
                        controller.isLoading
                            ? CircularProgressIndicator()
                            : Expanded(
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
                                      _evolution(),
                                      _about(),
                                    ],
                                  ),
                                ),
                              ),
                      ],
                    ),
                  );
                },
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

  Widget _evolution() {
    final second = controller.evolution.chain.evolvesTo;
    final secondID = second.first.species.url.split('/');
    final three = second.first.evolvesTo;
    final threeID = three.first.species.url.split('/');

    return SingleChildScrollView(
      child: Column(
        children: [
          WidgetEvolutionItem(
            name: controller.pokemon.name,
            id: controller.pokemon.id,
            secondID: int.parse(secondID[secondID.length - 2]),
            secondName: second.first.species.name,
            level: second.first.evolutionDetails.first.minLevel,
          ),
          WidgetEvolutionItem(
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

  Widget _movies() {}
}

class WidgetEvolutionItem extends StatelessWidget {
  const WidgetEvolutionItem({
    Key key,
    @required this.name,
    @required this.secondName,
    @required this.level,
    @required this.id,
    @required this.secondID,
  }) : super(key: key);

  final int id;
  final String name;
  final int secondID;
  final String secondName;
  final int level;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildItem(id,name),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.arrow_forward),
            Text(
              'Lvl $level',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        _buildItem(secondID,secondName),
      ],
    ).marginOnly(bottom: 40);
  }

  Widget _buildItem(int id, String name) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            shape: BoxShape.circle,
          ),
          child: CachedNetworkImage(
            imageUrl:
            'https://static.pokemonpets.com/images/monsters-images-300-300/$id-$name.png',
            height: 100,
            width: 100,
          ),
        ),
        Text(name),
      ],
    );
  }
}
