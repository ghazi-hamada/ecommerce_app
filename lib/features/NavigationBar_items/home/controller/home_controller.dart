import 'package:carousel_slider/carousel_controller.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/functions/handling_data.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/features/NavigationBar_items/home/data/models/categories_model.dart';
import 'package:ecommerce_app/features/NavigationBar_items/home/data/models/items_model.dart';
import 'package:ecommerce_app/features/NavigationBar_items/home/data/remote/home_data.dart';
import 'package:ecommerce_app/routes_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Abstract Controller
abstract class HomeController extends GetxController {
  void initialData();
  Future<void> getData();
  void logout();
  void changeIndex(int index);
  void goToItems(CategoriesModel categoriesModel);
  void inti();
  search();
  isSearchingItems(String value);
  clearSearch();
  goToProductDetails(ItemsModel itemsModel);
}

// Implementation
class HomeControllerImpl extends HomeController {
  // Controllers
  late TextEditingController searchController;
  late CarouselSliderController carouselController;
  late PageController pageController;

  // Services and Models
  final MyServices myServices = Get.find();
  final HomeData homeData = HomeData(Get.find());

  // User Information
  String username = '';
  String email = '';
  String phone = '';
  String id = '';

  // Application Data
  List categories = [];
  List items = [];
  List<ItemsModel> itemsSearch = [];
  StatusRequest statusRequest = StatusRequest.none;

  // State Variables
  int curntIndex = 0;
  bool isSearching = false;

  // Carousel Items
  final List<Map<String, String>> carouselItems = [
    {
      "image":
          "https://img.freepik.com/free-photo/fast-fashion-concept-with-woman-shopping_23-2150871364.jpg",
      "title": "Get Special Offer",
      "subtitle": "Up to 40%",
      "details": "All Services Available | T&C Applied",
    },
    {
      "image":
          "https://media.istockphoto.com/id/1451771765/photo/abstract-blue-gradient-background.jpg?s=612x612&w=0&k=20&c=F7k6wvmUyOTpGA6gfyahQZfsicquXvfJCijT46R3xzk=",
      "title": "Exclusive Deal",
      "subtitle": "Save Big Now!",
      "details": "Limited time offer!",
    },
    {
      "image":
          "https://img.freepik.com/free-photo/fast-fashion-concept-with-woman-shopping_23-2150871364.jpg",
      "title": "Get Special Offer",
      "subtitle": "Up to 40%",
      "details": "All Services Available | T&C Applied",
    },
    {
      "image":
          "https://media.istockphoto.com/id/1451771765/photo/abstract-blue-gradient-background.jpg?s=612x612&w=0&k=20&c=F7k6wvmUyOTpGA6gfyahQZfsicquXvfJCijT46R3xzk=",
      "title": "Exclusive Deal",
      "subtitle": "Save Big Now!",
      "details": "Limited time offer!",
    },
  ];

  // Lifecycle Methods
  @override
  void onInit() async {
    searchController = TextEditingController();
    carouselController = CarouselSliderController();

    // Load initial data
    await getData();

    // Retrieve user information from shared preferences
    inti();

    super.onInit();
  }

  // Initialize user information
  @override
  void inti() {
    username = myServices.sharedPreferences.getString('username') ?? '';
    email = myServices.sharedPreferences.getString('email') ?? '';
    phone = myServices.sharedPreferences.getString('phone') ?? '';
    id = myServices.sharedPreferences.getString('id') ?? '';
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  // Methods
  @override
  void initialData() {
    // TODO: Implement initialData
    throw UnimplementedError();
  }

  @override
  Future<void> getData() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await homeData.getData();
    print("Response: $response");

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        categories.addAll(response['categories'] ?? []);
        items.addAll(response['items'] ?? []);
        print("Categories: $categories");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  @override
  void logout() {
    statusRequest = StatusRequest.loading;
    update();

    // Clear user data and navigate to login
    myServices.sharedPreferences.setString('step', 'login');
    myServices.sharedPreferences.clear();
    Get.offNamed('/');

    statusRequest = StatusRequest.none;
    update();
  }

  @override
  void changeIndex(int index) {
    curntIndex = index;
    update();
  }

  @override
  void goToItems(CategoriesModel categoriesModel) {
    Get.toNamed(AppRoutes.kItems, arguments: {
      'categories': categories,
      'categorySelected': categoriesModel.categoriesId,
    });
  }

  @override
  search() async {
    isSearching = searchController.text.isNotEmpty;
    update();
    statusRequest = StatusRequest.loading;
    var response = await homeData.searchData(searchController.text);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        itemsSearch.clear();
        List responseItems = response['data'];
        itemsSearch
            .addAll(responseItems.map((e) => ItemsModel.fromJson(e)).toList());
      } else {
        Get.rawSnackbar(
          message: 'No items found',
          duration: const Duration(seconds: 1),
        );
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  isSearchingItems(String value) {
    // isSearching = value.isNotEmpty;
    // update();
  }

  @override
  clearSearch() {
    searchController.clear();
    itemsSearch.clear();
    isSearching = false;
    update();
  }

  @override
  goToProductDetails(ItemsModel itemsModel) {
    Get.toNamed(AppRoutes.kProductDetails,
        arguments: {'itemsmodel': itemsModel});
  }
}
