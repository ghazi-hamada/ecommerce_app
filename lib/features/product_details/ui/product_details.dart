import '../../../core/class/handling_data_view.dart';

import '../controller/product_details_controller.dart';
import 'widgets/button_NavigationBar_widget.dart';
import 'widgets/color_widget.dart';
import 'widgets/details_image.dart';
import 'widgets/title_body_details_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsControllerImpl());
    return Scaffold(
      bottomNavigationBar: bottomNavigationBarWidget(),
      body: GetBuilder<ProductDetailsControllerImpl>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          child: ListView(
            children: [
              DetailsImage(controller),
              const SizedBox(height: 100),
              TitleBodyDetailsProduct(controller, context),
              Container(
                margin: EdgeInsets.symmetric(horizontal: Get.width / 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Color",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        ...List.generate(
                            controller.subItems.length,
                            (index) => colorWidget(
                                  active: controller.subItems[index]['active'],
                                  text: controller.subItems[index]['name'],
                                ))
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
