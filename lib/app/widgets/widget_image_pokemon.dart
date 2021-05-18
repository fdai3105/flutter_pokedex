import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WidgetImagePokemon extends StatelessWidget {
  final int id;
  final double height;
  final double width;

  const WidgetImagePokemon({
    Key key,
    @required this.id,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: 'https://pokeres.bastionbot.org/images/pokemon/$id.png',
      // imageUrl:
      //     'https://static.pokemonpets.com/images/monsters-images-300-300/${controller.pokemon.id}-${controller.pokemon.name}.png',
      height: height,
      width: width,
      progressIndicatorBuilder: (context, url, progress) {
        return Center(
          child: CircularProgressIndicator(
            value: progress.progress,
          ),
        );
      },
      errorWidget: (context, url, err) {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
