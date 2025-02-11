import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../onboarding/ui/widgets/custom_button.dart';
import '../controller/checkout_controller.dart';
import 'widgets/build_card.dart';
import 'widgets/build_radio_tile.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CheckoutControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GetBuilder<CheckoutControllerImp>(builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Card 1: Payment Method
                buildCard(
                  title: "Choose Payment Method",
                  child: Column(
                    children: [
                      buildRadioTile(
                        title: "Cash",
                        value: "Cash",
                        groupValue: controller.paymentMethod,
                        icon: Icons.money,
                        onChanged: (value) =>
                            controller.changePaymentMethod(value.toString()),
                      ),
                      buildRadioTile(
                        title: "Credit Card",
                        value: "Credit Card",
                        groupValue: controller.paymentMethod,
                        icon: Icons.credit_card,
                        onChanged: (value) =>
                            controller.changePaymentMethod(value.toString()),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Card 2: Delivery Type
                buildCard(
                  title: "Choose Delivery Type",
                  child: Column(
                    children: [
                      buildRadioTile(
                        title: "Delivery",
                        value: "Delivery",
                        groupValue: controller.deliveryType,
                        icon: Icons.local_shipping,
                        onChanged: (value) =>
                            controller.changeDeliveryType(value.toString()),
                      ),
                      buildRadioTile(
                        title: "Drive Thru",
                        value: "Drive Thru",
                        groupValue: controller.deliveryType,
                        icon: Icons.drive_eta,
                        onChanged: (value) =>
                            controller.changeDeliveryType(value.toString()),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                controller.addresses.isEmpty &&
                        controller.deliveryType == "Delivery"
                    ? Container(
                        alignment: Alignment.center,
                        child: Column(
                          spacing: 5.h,
                          children: [
                            const Text("No Addresses Found"),
                            const Text("Please Add Addresses"),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColor.secondaryColor,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 5.h),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12))),
                                onPressed: () {
                                  controller.gotoaddAddress();
                                },
                                child: Text(
                                  "Add Address",
                                  style: TextStyle(
                                      fontSize: 16.sp, color: Colors.white),
                                )),
                          ],
                        ),
                      )
                    :
                    // Card 3: Shipping Address
                    Column(
                        children: [
                          controller.deliveryType == "Delivery"
                              ? buildCard(
                                  title: "Choose Shipping Address",
                                  child: DropdownButtonFormField<String>(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      filled: true,
                                      fillColor: Colors.grey[200],
                                    ),
                                    hint: Text("Select Address",
                                        style: TextStyle(fontSize: 16.sp)),
                                    value: controller.selectedAddress,
                                    items: controller.addresses.map((address) {
                                      return DropdownMenuItem<String>(
                                        value: address.id.toString(),
                                        child: Text(
                                            "${address.addressStreet} - ${address.addressName}"
                                                .toString(),
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.normal)),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      controller.changeSelectedAddress(
                                          value.toString());
                                    },
                                  ),
                                )
                              : const SizedBox.shrink(),
                          const SizedBox(height: 24),
                        ],
                      ),

                // Checkout Button
                Container(
                    margin: const EdgeInsets.only(
                        bottom: 20, top: 10, right: 16, left: 16),
                    child: CustomButton(
                        text: "Checkout", onPress: controller.checkout)),
              ],
            );
          }),
        ),
      ),
    );
  }
}
