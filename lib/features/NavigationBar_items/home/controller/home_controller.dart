import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/class/status_request.dart';
import '../../../../core/functions/handling_data.dart';
import '../../../../core/services/services.dart';
import '../data/models/categories_model.dart';
import '../data/models/items_model.dart';
import '../data/remote/home_data.dart';
import '../../../../routes_app.dart';

abstract class HomeController extends GetxController {
  getData();
  logout();
  changeIndex(int index);
  goToItems(CategoriesModel categoriesModel);
  goToProductDetails(ItemsModel itemsModel);
  isSearchingItems(String value);
  clearSearch();
  search();
}

class HomeControllerImpl extends HomeController {
  late TextEditingController searchController;
  MyServices myServices = Get.find();
  String username = '';
  String email = '';
  String phone = '';
  String id = '';
  List categories = [];
  List<ItemsModel> itemsSearch = [];
  bool isSearching = false;
  List items = [];
  StatusRequest statusRequest = StatusRequest.none;
  late CarouselSliderController carouselController;
  HomeData homeData = HomeData(Get.find());
  int curntIndex = 0;
  late PageController pageController;

  @override
  void onInit() async {
    searchController = TextEditingController();
    carouselController = CarouselSliderController();
    await getData();
    super.onInit();
    username = myServices.sharedPreferences.getString('username') ?? '';
    email = myServices.sharedPreferences.getString('email') ?? '';
    phone = myServices.sharedPreferences.getString('phone') ?? '';
    id = myServices.sharedPreferences.getString('id') ?? '';
  }

  @override
  logout() {
    statusRequest = StatusRequest.loading;
    update();
    myServices.sharedPreferences.setString('step', 'login');
    // clear all data
    myServices.sharedPreferences.clear();
    Get.offNamed('/');
    statusRequest = StatusRequest.none;
    update();
  }

  @override
  changeIndex(int index) {
    curntIndex = index;

    update();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        categories.addAll(response['categories'] ?? []);
        items.addAll(response['items'] ?? []);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  final List<Map<String, String>> carouselItems = [
    {
      "image":
          "https://img.freepik.com/free-photo/fast-fashion-concept-with-woman-shopping_23-2150871364.jpg", // استبدل بالصور الخاصة بك
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
          "https://img.freepik.com/free-photo/fast-fashion-concept-with-woman-shopping_23-2150871364.jpg", // استبدل بالصور الخاصة بك
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

  @override
  goToItems(CategoriesModel categoriesModel) {
    Get.toNamed(AppRoutes.kItems, arguments: {
      'categories': categories,
      'categorySelected': categoriesModel.categoriesId,
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  goToProductDetails(ItemsModel itemsModel) {
    Get.toNamed(AppRoutes.kProductDetails,
        arguments: {'itemsmodel': itemsModel});
  }

  @override
  isSearchingItems(String value) {
    itemsSearch.clear();
    isSearching = false;
    update();
  }

  @override
  clearSearch() {
    searchController.clear();
    itemsSearch.clear();
    isSearching = false;
    update();
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
}
