import 'dart:developer';

import '../../../core/class/post_data.dart';
import '../../../core/class/status_request.dart';
import '../../../core/constant/app_apis.dart';
import '../../../core/functions/handling_data.dart';
import '../../../core/services/services.dart';
import '../data/model/notification_model.dart';
import 'package:get/get.dart';

abstract class NotificationController extends GetxController {
  MyServices myServices = Get.find();
  PostData postData = PostData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  List<NotificationModel> notifications = [];

  getNotification();
}

class NotificationControllerImpl extends NotificationController {
  @override
  getNotification() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await postData.postData(
      linkurl: AppApis.notification,
      data: {
        "userid": myServices.sharedPreferences.getString('id')!,
      },
    );
    statusRequest = handlingData(response);
    log("statusRequest: $statusRequest");
    log("response: $response");
    update();
    if (statusRequest == StatusRequest.success) {
      List listdata = response['data'];
      notifications =
          listdata.map((item) => NotificationModel.fromJson(item)).toList();
    } else {}
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getNotification();
  }
}
