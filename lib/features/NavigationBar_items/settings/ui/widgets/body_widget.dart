import 'build_listTile_items_settings.dart';

import '../../../../../routes_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 50.h,
          ),
          ListTile(
              trailing: Switch(value: false, onChanged: (value) {}),
              title: const Text(
                "Disable Notification",
              )),
          //build_listTile_items_settings
          buildListTileItemsSettings(
            title: "Orders",
            icon: Icons.receipt_long_outlined,
            onTap: () {
              Get.toNamed(AppRoutes.kpending);
            },
          ),
          buildListTileItemsSettings(
            title: "Archive",
            icon: Icons.archive_outlined,
            onTap: () {},
          ),
          buildListTileItemsSettings(
              title: "Address",
              icon: Icons.location_on_outlined,
              onTap: () {
                Get.toNamed(AppRoutes.kAddressView);
              }),
          buildListTileItemsSettings(
              title: "About Us",
              icon: Icons.help_outline_rounded,
              onTap: () {}),
          buildListTileItemsSettings(
              title: "Contact Us",
              icon: Icons.phone_callback_outlined,
              onTap: () {}),
          buildListTileItemsSettings(
            title: "Logout",
            icon: Icons.logout,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
