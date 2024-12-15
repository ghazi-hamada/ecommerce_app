import 'dart:developer';

import '../../features/orders/controller/orders_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

requestPermissionNotification() async {
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmconfig() {
  print("fcmconfig====================");
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    // print(message.notification!.title);
    // print(message.notification!.body);
    Get.snackbar(message.notification!.title!, message.notification!.body!);
    refreshPageNotification(message.data);
  });
}

refreshPageNotification(data) {
  log("=====================================page id ${data['pageid']}");
  log("=====================================page name ${data['pagename']}");
  log("=====================================page type ${Get.currentRoute}");
  if (data['pagename'] == Get.currentRoute) {
    OrdersControllerImpl controller = Get.find();
    controller.getData();
  } else {
    log("=====================================not refresh page");
  }
}
