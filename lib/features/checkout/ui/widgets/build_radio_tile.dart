import '../../../../core/constant/color.dart';
import 'package:flutter/material.dart';

Widget buildRadioTile({
    required String title,
    required String value,
    required String? groupValue,
    required IconData icon,
    required void Function(String?) onChanged,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColor.primaryColor),
      title: Text(title),
      trailing: Radio<String>(
        activeColor: AppColor.primaryColor,
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
      ),
    );
  }
