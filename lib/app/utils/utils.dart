import 'package:flutter/material.dart';

export 'strings.dart';

Color colorByType(String type) {
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
