import '../../../core/class/handling_data_view.dart';
import '../../../core/constant/color.dart';
import 'widgets/custom_card_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/orders_controller.dart';
import 'package:jiffy/jiffy.dart';

class PendingScreen extends StatelessWidget {
  const PendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersControllerImpl());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pending Orders',
        ),
        backgroundColor: Colors.white,
      ),
      body: GetBuilder<OrdersControllerImpl>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: controller.pendingOrdersModel.length,
              itemBuilder: (context, index) {
                final order = controller.pendingOrdersModel[index];
                // custom_card_order
                return buildCardOrder(order: order, controller: controller);
              },
            ),
          );
        },
      ),
    );
  }
}
