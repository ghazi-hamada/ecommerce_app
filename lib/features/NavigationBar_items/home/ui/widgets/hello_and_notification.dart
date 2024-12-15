import '../../../../../routes_app.dart';
import '../../controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HelloAndNotification extends StatelessWidget {
  const HelloAndNotification({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeControllerImpl());
    return GetBuilder<HomeControllerImpl>(builder: (controller) {
      return Row(children: [
        Text(
          "Hello, ${controller.username}",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            Get.toNamed(AppRoutes.kNotification);
          },
          child: Container(
            width: 40.w,
            height: 40.h,
            decoration: const BoxDecoration(
              color: Color(0xffFF6866),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: const Icon(Icons.notifications_sharp,
                color: Colors.white, size: 30),
          ),
        ),
      ]);
    });
  }
}
