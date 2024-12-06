import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/features/product_details/controller/product_details_controller.dart';
import 'package:ecommerce_app/features/product_details/ui/widgets/button_NavigationBar_widget.dart';
import 'package:ecommerce_app/features/product_details/ui/widgets/color_widget.dart';
import 'package:ecommerce_app/features/product_details/ui/widgets/details_image.dart';
import 'package:ecommerce_app/features/product_details/ui/widgets/title_body_details_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductDetailsControllerImpl());
    return Scaffold(
      bottomNavigationBar: bottomNavigationBarWidget(),
      body: ListView(
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
  }
}
