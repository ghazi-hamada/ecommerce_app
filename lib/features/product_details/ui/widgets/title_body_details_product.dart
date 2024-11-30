import 'package:flutter/material.dart';

import 'package:ecommerce_app/features/product_details/controller/product_details_controller.dart';
import 'package:ecommerce_app/features/product_details/ui/widgets/caunter_and_price.dart';

Container TitleBodyDetailsProduct(
    ProductDetailsControllerImpl controller, BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(controller.itemsModel.itemsName!,
            style: Theme.of(context).textTheme.displayLarge),
        CaunterAndPrice(context, controller),
        const SizedBox(height: 10),
        Text(
          controller.itemsModel.itemsDesc!.toLowerCase().length > 100
              ? "${controller.itemsModel.itemsDesc!.toLowerCase().substring(0, 100)}..."
              : controller.itemsModel.itemsDesc!.toLowerCase(),
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: const Color.fromARGB(255, 95, 95, 95),
              fontSize: 16,
              fontWeight: FontWeight.normal,
              wordSpacing: 1.5),
        ),
      ],
    ),
  );
}
