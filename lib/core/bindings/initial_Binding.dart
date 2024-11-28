import 'package:get/get.dart';

import 'package:ecommerce_app/core/class/crud.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
