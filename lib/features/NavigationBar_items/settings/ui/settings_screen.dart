import '../../../../core/class/handling_data_view.dart';
import '../controller/settings_controller.dart';
import 'widgets/appBar_widget.dart';
import 'widgets/body_widget.dart';
import 'widgets/custom_design.dart';
import 'package:flutter/material.dart';
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
