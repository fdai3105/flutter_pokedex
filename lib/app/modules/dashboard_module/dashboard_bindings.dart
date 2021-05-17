import 'package:get/get.dart';

import '../../data/provider/providers.dart';
import '../../data/repository/dashboard_repository.dart';
import 'dashboard.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController(
        repository: DashboardRepository(provider: DashboardProvider())));
  }
}
