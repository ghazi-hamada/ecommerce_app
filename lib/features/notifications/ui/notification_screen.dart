import '../../../core/class/handling_data_view.dart';
import '../../../core/constant/color.dart';
import '../controller/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationControllerImpl controller =
        Get.put(NotificationControllerImpl());

    // Function to format time difference in a short format
    String formatDuration(DateTime notificationTime) {
      final now = DateTime.now();
      final difference = now.difference(notificationTime);

      if (difference.inMinutes < 1) {
        return '${difference.inSeconds}s';
      } else if (difference.inHours < 1) {
        return '${difference.inMinutes}m';
      } else if (difference.inDays < 1) {
        return '${difference.inHours}h';
      } else {
        return '${difference.inDays}d';
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: GetBuilder<NotificationControllerImpl>(
          builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: controller.notifications.length,
                  itemBuilder: (context, index) {
                    final notification = controller.notifications[index];
                    final notificationTime =
                        Jiffy.parse(notification.notificationDatetime!)
                            .dateTime;

                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor:
                              AppColor.primaryColor.withOpacity(0.2),
                          child: Text(
                              controller.myServices.sharedPreferences
                                  .getString('username')![0]
                                  .toUpperCase()
                                  .toString(),
                              style: const TextStyle(
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    notification.notificationTitle!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    formatDuration(notificationTime),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                notification.notificationBody!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    );
                  },
                ),
              )),
    );
  }
}
