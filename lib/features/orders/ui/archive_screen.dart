import 'package:ecommerce_app/features/orders/controller/archive_controller.dart';

import '../../../core/class/handling_data_view.dart';
import 'widgets/custom_card_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/orders_controller.dart';

class ArchiveScreen extends StatelessWidget {
  const ArchiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArchiveControllerImpl());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Archived Orders',
        ),
        backgroundColor: Colors.white,
      ),
      body: GetBuilder<ArchiveControllerImpl>(
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
