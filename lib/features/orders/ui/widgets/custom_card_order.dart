import 'package:get/get.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/functions/orders_fun.dart';
import '../../../../core/localization/strings_keys.dart';
import '../../data/model/pending_orders_model.dart';
import 'build_elevated_button.dart';
import 'build_text_order.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

Widget buildCardOrder(
    {required PendingOrdersModel order, required controller}) {
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
                  text: '${StringsKeys.orderNumber.tr}: #${order.ordersId}',
                  onUp: true),

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
                  '${StringsKeys.orderType.tr}: ${printOrderType(order.ordersType!)}'),
          buildTextOrder(
              text:
                  '${StringsKeys.orderMethod.tr}: ${printPaymentType(order.orderPaymentMethod!)}'),
          buildTextOrder(
              text:
                  '${StringsKeys.totalPrice.tr}: \$${order.ordersTotalPrice}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildTextOrder(
                  text:
                      '${StringsKeys.deliveryPrice.tr}: \$${order.ordersPriceDelivery}'),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: statusColor?.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  printOrderStatus(order.ordersStatus!),
                  style: TextStyle(
                    color: statusColor,
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
                '${StringsKeys.totalPrice.tr}: \$${order.ordersTotalPrice}',
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
                      text: StringsKeys.cancel.tr,
                      onPressed: () => controller.deleteOrder(order.ordersId!),
                    ),
                  if (order.ordersStatus == 4)
                    buildElevatedButton(
                      text: StringsKeys.rating.tr,
                      onPressed: () => controller.showRatingItemsScreen(order),
                    ),
                  const SizedBox(width: 8),
                  buildElevatedButton(
                    text: StringsKeys.details.tr,
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
