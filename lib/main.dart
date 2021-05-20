import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/modules/pokemon_module/pokemon.dart';
import 'app/routes/app_pages.dart';

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
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      initialBinding: PokemonBinding(),
      home: PokemonPage(),
    );
  }
}
