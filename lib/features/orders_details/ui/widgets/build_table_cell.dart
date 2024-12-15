import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildTableCell(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
    child: Text(
      text,
      maxLines: 3,
      style: TextStyle(
        fontSize: 12.sp,
        color: Colors.black87,
        overflow: TextOverflow.ellipsis,
      ),
      textAlign: TextAlign.center,
    ),
  );
}
