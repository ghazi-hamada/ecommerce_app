import 'package:flutter/material.dart';

import '../../../../core/constant/color.dart';
import '../../../orders/data/model/pending_orders_model.dart';

Widget buildAddressCard({required PendingOrdersModel address}) {
  return Card(
    elevation: 4,
    shadowColor: Colors.grey.shade200,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: ListTile(
      leading: const Icon(
        Icons.location_pin,
        color: AppColor.primaryColor,
        size: 30,
      ),
      title: Text(
        address.addressCity!,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        '${address.addressStreet!}, ${address.addressName!}',
        style: const TextStyle(fontSize: 14),
      ),
      trailing: const Icon(Icons.chevron_right, color: AppColor.primaryColor),
    ),
  );
}
