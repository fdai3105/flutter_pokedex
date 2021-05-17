import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/app/utils/utlis.dart';

import '../../../data/models/pokemon_detail.dart';

part 'widget_poke_ball.dart';

class WidgetItem extends StatelessWidget {
  final int id;
  final String name;
  final List<Type> types;
  final Function onTap;

  const WidgetItem({
    Key key,
    @required this.id,
    @required this.name,
    @required this.types,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: colorByType(types.first.type.name),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: -50,
              right: -120,
              left: -30,
              top: -30,
              child: _WidgetPokeBall(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          name,
                          softWrap: false,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: _buildType(),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://static.pokemonpets.com/images/monsters-images-300-300/$id-$name.png',
                      // imageUrl: 'https://pokeres.bastionbot.org/images/pokemon/$id.png',
                      progressIndicatorBuilder: (context, url, progress) {
                        return Center(
                            child: CircularProgressIndicator(
                                value: progress.progress));
                      },
                      height: 100,
                      width: 100,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildType() {
    return types.map<Widget>((e) {
      return Container(
        margin: const EdgeInsets.only(bottom: 4),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          e.type.name,
          style: const TextStyle(color: Colors.white),
        ),
      );
    }).toList();
  }
}