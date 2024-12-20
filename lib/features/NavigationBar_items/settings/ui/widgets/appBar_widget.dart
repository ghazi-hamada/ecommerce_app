import '../../../../../core/localization/strings_keys.dart';
import '../../controller/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppBarWidget extends GetView<SettingsController> {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SettingsController());
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      width: double.infinity,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10, top: 15),
            alignment: Alignment.centerLeft,
            child: Text(
              StringsKeys.settings.tr,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                      "https://scontent.fjrs2-2.fna.fbcdn.net/v/t39.30808-6/466777075_3659763364336067_8119798559185254603_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=_o18WqVW9oIQ7kNvgHghPn7&_nc_zt=23&_nc_ht=scontent.fjrs2-2.fna&_nc_gid=AfU8PEGgYZ9yEaXg0mYfU3L&oh=00_AYCNtBlTzXiiIPfdiOqUWExAt5xn_R9DIlUREFtnPqF00Q&oe=6763232E"),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.username,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    controller.email,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
