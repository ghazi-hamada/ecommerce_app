import 'package:ecommerce_app/core/constant/color.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/localization/change_local.dart';
import '../../../../../core/localization/strings_keys.dart';
import '../../controller/settings_controller.dart';
import '../../language_selection_screen.dart';
import 'build_listTile_items_settings.dart';

import '../../../../../routes_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BodyWidget extends GetView<SettingsController> {
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
              title: Text(
                StringsKeys.disableNotification.tr,
              )),
          //build_listTile_items_settings
          buildListTileItemsSettings(
            title: StringsKeys.orders.tr,
            icon: Icons.receipt_long_outlined,
            onTap: () {
              Get.toNamed(AppRoutes.kpending);
            },
          ),
          buildListTileItemsSettings(
            title: StringsKeys.archive.tr,
            icon: Icons.archive_outlined,
            onTap: () {
              Get.toNamed(AppRoutes.kArchivedOrders);
            },
          ),
          buildListTileItemsSettings(
              title: StringsKeys.address.tr,
              icon: Icons.location_on_outlined,
              onTap: () {
                Get.toNamed(AppRoutes.kAddressView);
              }),
          buildListTileItemsSettings(
              title: StringsKeys.aboutUs.tr,
              icon: Icons.help_outline_rounded,
              onTap: () {}),
          buildListTileItemsSettings(
              title: StringsKeys.contactUs.tr,
              icon: Icons.phone_callback_outlined,
              onTap: () async {
                await launchUrl(Uri.parse("tel:+972 56-703-8090"));
              }),
          buildListTileItemsSettings(
              title: StringsKeys.language.tr,
              icon: Icons.language_outlined,
              onTap: () async {
                Get.to(() => const LanguageSelectionScreen());
              }),
          buildListTileItemsSettings(
            title: StringsKeys.logout.tr,
            icon: Icons.logout,
            onTap: () {
              Get.defaultDialog(
                title: StringsKeys.logout.tr,
                middleText: StringsKeys.logoutConfirmation.tr,
                actions: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(StringsKeys.cancel.tr),
                  ),
                  TextButton(
                    onPressed: () {
                      controller.logoutuser();
                    },
                    child: const Text("Logout"),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
// language_selection_screen
