import 'package:flutter_pokedex/app/data/provider/dashboard_provider.dart';
import 'package:flutter/cupertino.dart';

class DashboardRepository {
  final DashboardProvider provider;

  DashboardRepository({@required this.provider}) : assert(provider != null);

  getUser(id) {
    return provider.getUser(id);
  }

  postUser(Map data) {
    return provider.postUser(data);
  }

}