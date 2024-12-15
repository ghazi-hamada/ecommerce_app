import 'package:flutter/material.dart';

import '../../../../core/constant/color.dart';

Widget buildAddressCard() {
    return Card(
      elevation: 4,
      shadowColor: Colors.grey.shade200,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: const ListTile(
        leading: Icon(
          Icons.location_pin,
          color: AppColor.primaryColor,
          size: 30,
        ),
        title: Text(
          "Delivery Address",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'address.addressStreet, address.addressCity',
          style: TextStyle(fontSize: 14),
        ),
        trailing: Icon(Icons.chevron_right, color: AppColor.primaryColor),
      ),
    );
  }