import '../../../../core/constant/color.dart';
import '../../controller/orders_controller.dart';
import '../../data/model/pending_orders_model.dart';
import 'build_elevated_button.dart';
import 'build_text_order.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

Widget buildCardOrder(
    {required PendingOrdersModel order,
    required OrdersControllerImpl controller}) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    elevation: 4,
    margin: const EdgeInsets.only(bottom: 16),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 4,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // fontSize: 16
              buildTextOrder(
                  text: 'Order Number: #${order.ordersId}', onUp: true),

              Text(
                Jiffy.parse(order.ordersDaterime!).fromNow(),
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColor.primaryColor,
                ),
              ),
            ],
          ),
          const Divider(color: Colors.grey),
          buildTextOrder(
              text:
                  'Order Type: ${controller.printOrderType(order.ordersType!)}'),
          buildTextOrder(
              text:
                  'Order Type: ${controller.printOrderType(order.ordersType!)}'),
          buildTextOrder(
              text:
                  'Payment Method: ${controller.printPaymentType(order.orderPaymentMethod!)}'),
          buildTextOrder(text: 'Order Price: \$${order.ordersTotalPrice}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildTextOrder(
                  text: 'Delivery Price: \$${order.ordersPriceDelivery}'),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xff003090).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  controller.printOrderStatus(order.ordersStatus!),
                  style: const TextStyle(
                    color: Color(0xff003090),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const Divider(height: 24, color: Colors.grey),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Price: \$${order.ordersTotalPrice}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryColor,
                ),
              ),
              Row(
                children: [
                  if (order.ordersStatus == 0)
                    buildElevatedButton(
                      text: 'Cancel',
                      onPressed: () => controller.deleteOrder(order.ordersId!),
                    ),
                  const SizedBox(width: 8),
                  buildElevatedButton(
                    text: 'Details',
                    onPressed: () => controller.showOrderDetailScreen(order),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
