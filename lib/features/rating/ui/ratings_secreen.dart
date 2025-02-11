import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:ecommerce_app/core/constant/app_apis.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/features/onboarding/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/class/handling_data_view.dart';
import '../controller/ratings_controller.dart';

class RatingScreen extends StatelessWidget {
  const RatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RatingsControllerImpl());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ratings"),
      ),
      body: GetBuilder<RatingsControllerImpl>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            child: ListView.builder(
              itemCount: controller.orderDetailsModel.length,
              itemBuilder: (context, index) {
                return controller.orderDetailsModel[index].hasRating == 1
                    ? Container()
                    : Container(
                        margin: const EdgeInsets.only(
                            bottom: 30, top: 10, left: 10, right: 10),
                        padding: const EdgeInsets.all(10),
                        child: Card(
                          child: Column(
                            spacing: 10,
                            children: [
                              Container(
                                height: 150.h,
                                width: Get.width * 0.8,
                                decoration: const BoxDecoration(
                                  color: AppColor.backgroundcolor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                alignment: Alignment.center,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "${AppApis.imageItems}/${controller.orderDetailsModel[index].itemsImage}",
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                  width: 200.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              RatingBar(
                                alignment: Alignment.centerLeft,
                                filledIcon: Icons.star,
                                emptyIcon: Icons.star_border,
                                onRatingChanged: (value) =>
                                    controller.setRating(value, index),
                                initialRating: controller.rating[
                                    '${controller.orderDetailsModel[index].itemsId}']!,
                                maxRating: 5,
                              ),
                              Container(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  controller
                                      .orderDetailsModel[index].itemsName!,
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.black),
                                ),
                              ),
                              // write review note for item
                              Container(
                                padding: const EdgeInsets.all(8),
                                child: TextField(
                                  onChanged: (value) {
                                    controller.setReview(value);
                                  },
                                  decoration: const InputDecoration(
                                    hintText: 'Write your review',
                                    border: OutlineInputBorder(),
                                  ),
                                  maxLines: 3,
                                ),
                              ),

                              // submit review

                              CustomButton(
                                  text: "Submit",
                                  onPress: () {
                                    controller.sendReview(controller
                                        .orderDetailsModel[index].itemsId!);
                                  }),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      );
              },
            ),
          );
        },
      ),
    );
  }
}
