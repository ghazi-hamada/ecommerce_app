import 'package:carousel_slider/carousel_controller.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/functions/handling_data.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/features/home/data/models/categories_model.dart';
import 'package:ecommerce_app/features/home/data/remote/home_data.dart';
import 'package:ecommerce_app/features/onboarding/ui/widgets/point_indicator.dart';
import 'package:ecommerce_app/routes_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  initialData();
  getData();
  logout();
  changeIndex(int index);
  goToItems(CategoriesModel categoriesModel);
}

class HomeControllerImpl extends HomeController {
  MyServices myServices = Get.find();
  String username = '';
  String email = '';
  String phone = '';
  String id = '';
  List categories = [];
  List items = [];
  StatusRequest statusRequest = StatusRequest.none;
  late CarouselSliderController carouselController;
  HomeData homeData = HomeData(Get.find());
  int curntIndex = 0;

  @override
  void onInit() async {
    carouselController = CarouselSliderController();
    await getData();
    late PageController pageController;
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
  initialData() {
    // TODO: implement initialData
    throw UnimplementedError();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.getData();
    print("===========> $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        print("===========> $response");
        categories.addAll(response['categories'] ?? []);
        items.addAll(response['items'] ?? []);
        print("===========categories=========> $categories");
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
}
