import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/functions/handling_data.dart';
import 'package:ecommerce_app/features/home/data/models/categories_model.dart';
import 'package:ecommerce_app/features/home/data/models/items_model.dart';
import 'package:ecommerce_app/features/items/data/remote/items_data.dart';
import 'package:ecommerce_app/routes_app.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  changeItemCategories(int index);
  getItems();
  showProductDetails(ItemsModel itemsModel);
}

class ItemsControllerImpl extends ItemsController {
  late List categoriesModel;
  late int categoriesId;
  ItemsData itemsData = ItemsData(Get.find());
  RxList items = [].obs;
  RxList dataItems = [].obs;

  late StatusRequest statusRequest;
  @override
  getItems() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        dataItems.addAll(response['data']);
        statusRequest = StatusRequest.none;
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    //get data from arguments
    categoriesModel = Get.arguments['categories'];
    categoriesId = Get.arguments['categorySelected'];
    items.addAll(dataItems
        .where((element) => element['categories_id'] == categoriesId)
        .toList());

    getItems();
    super.onInit();
  }

  @override
  changeItemCategories(int index) {
    categoriesId = index;
    items.value = dataItems
        .where((element) => element['categories_id'] == categoriesId)
        .toList();
    update();
  }
  
  @override
  showProductDetails(ItemsModel itemsModel) {
     Get.toNamed(AppRoutes.kProductDetails,
        arguments: {'itemsmodel': itemsModel});
  }
}
