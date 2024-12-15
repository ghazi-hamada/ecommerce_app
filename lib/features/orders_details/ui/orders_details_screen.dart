import '../../../core/class/handling_data_view.dart';
import '../controller/order_details_controller.dart';
import 'widgets/build_address_card.dart';
import 'widgets/build_map_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import 'widgets/build_order_table.dart';

class OrdersDetailsScreen extends StatelessWidget {
  const OrdersDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsControllerImpl());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text(
          'Orders Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Get.back(),
        ),
      ),
      body: GetBuilder<OrderDetailsControllerImpl>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildOrderTable(controller),
                SizedBox(height: 20.h),
                Center(
                  child: Text(
                    "Total Price: \$${controller.pendingOrders.ordersTotalPrice}",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
                const Divider(height: 40, thickness: 1.5),
                if (controller.pendingOrders.ordersType == 0)
                  buildAddressCard(),
                if (controller.pendingOrders.ordersType == 0)
                  buildMapView(controller),
              ],
            ),
          ),
        );
      }),
    );
  }


}
