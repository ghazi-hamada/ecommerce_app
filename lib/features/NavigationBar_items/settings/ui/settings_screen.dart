import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/localization/strings_keys.dart';
import 'package:ecommerce_app/features/NavigationBar_items/settings/controller/settings_controller.dart';
import 'package:ecommerce_app/features/NavigationBar_items/settings/ui/widgets/appBar_widget.dart';
import 'package:ecommerce_app/features/NavigationBar_items/settings/ui/widgets/body_widget.dart';
import 'package:ecommerce_app/features/NavigationBar_items/settings/ui/widgets/custom_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsController());
    return GetBuilder<SettingsController>(builder: (controller) {
      return HandlingDataView(
        statusRequest: controller.statusRequest,
        child: const SizedBox(
          width: double.infinity,
          child: CustomDesign(
            // appBar_widget
            childAppbar: AppBarWidget(),
            // body_widget
            child: BodyWidget(),
          ),
        ),
      );
    });
  }
}
