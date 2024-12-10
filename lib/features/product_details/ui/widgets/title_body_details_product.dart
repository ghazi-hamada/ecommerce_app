import 'package:flutter/material.dart';

import '../../controller/product_details_controller.dart';
import 'caunter_and_price.dart';

Container TitleBodyDetailsProduct(
    ProductDetailsControllerImpl controller, BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(controller.itemsModel.itemsName!,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold)),
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
