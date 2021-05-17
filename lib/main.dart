import 'package:flutter/material.dart';
import 'package:flutter_pokedex/app/modules/pokemon_module/pokemon.dart';
import 'package:get/get.dart';
import 'app/modules/dashboard_module/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: PokemonBinding(),
      home: PokemonPage(),
    );
  }
}