import 'package:flutter_pokedex/app/data/repository/dashboard_repository.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController{

  final DashboardRepository repository;

  DashboardController({this.repository});

  var _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;
}
