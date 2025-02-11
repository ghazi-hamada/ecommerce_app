import 'dart:developer';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:ecommerce_app/core/constant/app_apis.dart';
import 'package:ecommerce_app/features/search/controller/search_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/class/post_data.dart';
import '../../../../core/class/status_request.dart';
import '../../../../core/functions/handling_data.dart';
import '../../../../core/services/services.dart';
import '../data/models/banners_model.dart';
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

  MyServices myServices = Get.find();
  List<BannersModel> banners = [];
  String username = '';
  String email = '';
  String phone = '';
  String id = '';
  List categories = [];
  List items = [];
  StatusRequest statusRequest = StatusRequest.none;
  late CarouselSliderController carouselController;
  HomeData homeData = HomeData(Get.find());
  PostData postData = PostData(Get.find());
  int curntIndex = 0;
  late PageController pageController;
  TextEditingController searchController = TextEditingController();
  getBanner();
}

class HomeControllerImpl extends HomeController {
  @override
  logout() {
    // unsubscribe from topics
    String userId = myServices.sharedPreferences.getString('id')!;
    FirebaseMessaging.instance.unsubscribeFromTopic('users');
    FirebaseMessaging.instance.unsubscribeFromTopic('users$userId');

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
    var response = await postData.postData(linkurl: AppApis.homepage, data: {});
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      response.fold((l) {
        statusRequest = StatusRequest.failure;
        update();
      }, (response) {
        if (response['status'] == 'success') {
          categories.addAll(response['categories']['data'] ?? []);
          items.addAll(response['items']['data'] ?? []);
        }
      });
    }
    update();
  }

  @override
  goToItems(CategoriesModel categoriesModel) {
    Get.toNamed(AppRoutes.kItems, arguments: {
      'categories': categories,
      'categorySelected': categoriesModel.categoriesId,
    });
  }

  @override
  goToProductDetails(ItemsModel itemsModel) {
    Get.toNamed(AppRoutes.kProductDetails,
        arguments: {'itemsmodel': itemsModel});
  }

  @override
  getBanner() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await postData.postData(linkurl: AppApis.banner, data: {});
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      response.fold((l) {
        statusRequest = StatusRequest.failure;
        update();
      }, (response) {
        if (response['status'] == 'success') {
          List<dynamic> data = response['data'];
          banners.addAll(data.map((e) => BannersModel.fromJson(e)).toList());
          statusRequest = StatusRequest.none;
          update();
        } else {
          statusRequest = StatusRequest.failure;
          update();
        }
      });
    }
    update();
  }

  @override
  void onClose() {
    log('==========================onClose');
    searchController.dispose();
    super.onClose();
  }

  @override
  void dispose() {
    log('==========================dispose');
    searchController.dispose();
    super.dispose();
  }

  @override
  void onInit() async {
    log('==========================onInit');
    searchController = TextEditingController();
    carouselController = CarouselSliderController();
    await getData();
    super.onInit();
    getBanner();
    username = myServices.sharedPreferences.getString('username') ?? '';
    email = myServices.sharedPreferences.getString('email') ?? '';
    phone = myServices.sharedPreferences.getString('phone') ?? '';
    id = myServices.sharedPreferences.getString('id') ?? '';
  }
}
