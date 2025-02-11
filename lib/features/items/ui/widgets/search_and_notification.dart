import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';
import '../../../../routes_app.dart';
import '../../../search/controller/search_controller.dart';
import '../../../search/ui/search_widget.dart';
import '../../controller/items_controller.dart';

class SearchAndNotification extends StatelessWidget {
  const SearchAndNotification({
    super.key,
    required this.searchController,
  });
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    SearchControllerImpl controller = Get.put(SearchControllerImpl());
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
      height: 70.h,
      decoration: const BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 11,
            child: SearchWidget(
              searchController: searchController,
              onChanged: (value) {
                controller.isSearchingItems(value);
              },
              onPressedSearch: () {
                controller.search(search: searchController.text);
              },
              onPressedClear: () => controller.clearSearch(),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () {
                Get.toNamed(AppRoutes.kNotification);
              },
              child: Container(
                width: 30.w,
                height: 40.h,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Icon(Icons.notifications,
                    color: const Color(0xffD04142), size: 24.sp),
              ),
            ),
          )
        ],
      ),
    );
  }
}
