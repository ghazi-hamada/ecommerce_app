import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/features/test/controller/test_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => TestController());
    return Scaffold(
      body: GetBuilder<TestController>(builder: (controller) {
        return HandlingDataView(
            statusRequest: controller.statusRequest,
            child: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${controller.data[index]['users_name']}"),
                );
              },
            ));
      }),
    );
  }
}
