import 'package:flutter_pokedex/app/modules/dashboard_module/dashboard_controller.dart';
import 'package:flutter_pokedex/app/data/provider/dashboard_provider.dart';
import 'package:flutter_pokedex/app/data/repository/dashboard_repository.dart';
import 'package:get/get.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController(repository: DashboardRepository(provider: DashboardProvider())));
  }
}