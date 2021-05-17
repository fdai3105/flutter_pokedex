import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/models/pokemon_detail.dart';

class WidgetItem extends StatelessWidget {
  final int id;
  final String name;
  final List<Type> types;

  const WidgetItem({
    Key key,
    @required this.id,
    @required this.name,
    @required this.types,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _colorByType(types.first.type.name),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0,4),
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

  Color _colorByType(String type) {
    switch (type) {
      case 'grass':
        return Colors.green;
        break;
      case 'fire':
        return Colors.red;
        break;
      case 'water':
        return Colors.blue;
        break;
      case 'bug':
        return Colors.lightGreen;
        break;
      case 'normal':
        return Colors.grey;
        break;
      case 'poison':
        return Colors.purple;
        break;
      case 'electric':
        return Colors.yellow;
        break;
      case 'ground':
        return Colors.brown;
        break;
      case 'fairy':
        return Colors.pink;
        break;
      default:
        return Colors.white;
        break;
    }
  }
}

class _WidgetPokeBall extends StatefulWidget {
  @override
  __WidgetPokeBallState createState() => __WidgetPokeBallState();
}

class __WidgetPokeBallState extends State<_WidgetPokeBall>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * pi,
          child: Image.asset(
            'assets/images/pokeball.png',
            color: Colors.white24,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
