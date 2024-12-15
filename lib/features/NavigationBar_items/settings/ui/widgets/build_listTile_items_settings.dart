import '../../../../../routes_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget buildListTileItemsSettings(
    {required String title, required IconData icon, required Function onTap}) {
  return InkWell(
    onTap: () {
      onTap();
    },
    child: ListTile(
        trailing: Icon(
          icon,
          size: 26.sp,
        ),
        title: Text(
          title,
        )),
  );
}
