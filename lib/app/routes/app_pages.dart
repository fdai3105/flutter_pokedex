import '../../app/modules/pokemon_detail_module/pokemon_detail_page.dart';
import '../../app/modules/pokemon_detail_module/pokemon_detail_bindings.dart';
import '../../app/modules/pokemon_module/pokemon_page.dart';
import '../../app/modules/pokemon_module/pokemon_bindings.dart';
import '../../app/modules/dashboard_module/dashboard_bindings.dart';
import '../../app/modules/dashboard_module/dashboard_page.dart';
import 'package:get/get.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.DASHBOARD,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.POKEMON,
      page: () => PokemonPage(),
      binding: PokemonBinding(),
    ),
    GetPage(
      name: Routes.POKEMON_DETAIL,
      page: () => PokemonDetailPage(),
      binding: PokemonDetailBinding(),
    ),
  ];
}
