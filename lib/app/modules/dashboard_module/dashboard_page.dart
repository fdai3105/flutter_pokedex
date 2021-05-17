import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_pokedex/app/modules/dashboard_module/dashboard_controller.dart';

class DashboardPage extends GetWidget<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('dashboard Page')),
      body: Container(
        child: Obx(()=>Container(child: Text(controller.obj),)),
      ),
    );
  }
}
