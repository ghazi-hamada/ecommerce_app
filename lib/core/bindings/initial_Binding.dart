import 'package:ecommerce_app/features/search/controller/search_controller.dart';
import 'package:get/get.dart';

import '../../features/NavigationBar_items/cart/controller/cart_controller.dart';
import '../class/crud.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    Get.lazyPut<CartControllerImp>(() => CartControllerImp());
        Get.lazyPut<SearchControllerImpl>(() => SearchControllerImpl());

  }
}
