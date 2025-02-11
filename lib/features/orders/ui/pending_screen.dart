import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/features/orders/ui/widgets/custom_card_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/features/orders/controller/orders_controller.dart';
import 'package:jiffy/jiffy.dart';

import '../../../core/localization/strings_keys.dart';

class PendingScreen extends StatelessWidget {
  const PendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersControllerImpl());

    return Scaffold(
      appBar: AppBar(
        title:   Text(
          StringsKeys.pendingOrders.tr,
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
