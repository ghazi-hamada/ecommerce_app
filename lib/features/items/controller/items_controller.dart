import '../../../core/class/status_request.dart';
import '../../../core/functions/handling_data.dart';
import '../../../core/services/services.dart';
import '../../NavigationBar_items/cart/controller/cart_controller.dart';
import '../../NavigationBar_items/home/data/models/items_model.dart';
import '../data/remote/items_data.dart';
import '../../product_details/ui/product_details.dart';
import '../../../routes_app.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  changeItemCategories(int index);
  getItems();
  showProductDetails(ItemsModel itemsModel);
  // Check if the product is in the cart
  late List categoriesModel;
  late int categoriesId;
  ItemsData itemsData = ItemsData(Get.find());
  List categories = [];
  List items = [];
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
}

class ItemsControllerImpl extends ItemsController {
  final CartControllerImp cartControllerCart = Get.put(CartControllerImp());
  @override
  getItems() async {
    items.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.getData(
      id: categoriesId.toString(),
      userId: myServices.sharedPreferences.getString('id')!,
    );
    print(
        "categoriesId: $categoriesId ====================== id: ${myServices.sharedPreferences.getString('id')}");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        items.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  @override
  void onInit() async {
    //get data from arguments
    categoriesModel = Get.arguments['categories'];
    categoriesId = Get.arguments['categorySelected'];

    getItems();
 

    super.onInit();
  }

  @override
  changeItemCategories(int index) {
    categoriesId = index;
    getItems();
    update();
  }

  @override
  showProductDetails(ItemsModel itemsModel) {
    Get.toNamed(AppRoutes.kProductDetails, arguments: {
      'itemsmodel': itemsModel,
    });
  }
}
