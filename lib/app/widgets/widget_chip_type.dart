import 'package:flutter/material.dart';
import '../data/models/models.dart';

class WidgetChipType extends StatelessWidget {
  final List<Type> types;
  final Axis axis;

  const WidgetChipType({
    Key key,
    @required this.types,
    this.axis = Axis.horizontal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: axis,
      children: types.map((e) {
        return Container(
          margin: const EdgeInsets.only(bottom: 4,right: 4),
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
      }).toList(),
    );
  }
}
