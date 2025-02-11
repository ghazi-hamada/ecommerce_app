import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/features/NavigationBar_items/home/ui/widgets/list_items_search.dart';
import 'package:ecommerce_app/features/NavigationBar_items/offers/controller/offers_controller.dart';
import 'package:ecommerce_app/features/NavigationBar_items/offers/ui/improved_offer_card.dart';
import 'package:ecommerce_app/features/search/ui/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/class/handling_data_view.dart';
import '../../../../routes_app.dart';
import '../../../items/ui/widgets/search_and_notification.dart';
import '../../../search/controller/search_controller.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OffersControllerImp());
    SearchControllerImpl searchController = Get.put(SearchControllerImpl());
    return GetBuilder<OffersControllerImp>(builder: (controller) {
      return Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
            height: 100.h,
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
                    searchController: controller.searchController,
                    onChanged: (value) {
                      searchController.isSearchingItems(value);
                    },
                    onPressedSearch: () {
                      searchController.search(isOffers: true, search: controller.searchController.text);
                    },
                    onPressedClear: () => searchController.clearSearch(),
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
          ),
          GetBuilder<SearchControllerImpl>(builder: (searchController) {
            return searchController.isSearching &&
                    searchController.itemsSearch.isNotEmpty
                ? ListItemsSearch(listData: searchController.itemsSearch)
                : HandlingDataView(
                    statusRequest: controller.statusRequest,
                    child: Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.all(12),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.75,
                        ),
                        itemCount: controller.offers.length,
                        itemBuilder: (context, index) {
                          final offer = controller.offers[index];
                          return ImprovedOfferCard(offer: offer);
                        },
                      ),
                    ),
                  );
          }),
        ],
      );
    });
  }
}
