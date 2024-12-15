import 'build_table_cell.dart';
import 'build_table_headers.dart';
import 'package:flutter/material.dart';

import '../../controller/order_details_controller.dart';

Widget buildOrderTable(OrderDetailsControllerImpl controller) {
    return Card(
      elevation: 5,
      shadowColor: Colors.grey.shade200,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Table(
          border: TableBorder.all(color: Colors.grey.shade200),
          children: [
            TableRow(
              decoration: BoxDecoration(color: Colors.grey.shade100),
              children: buildTableHeaders(),
            ),
            ...List.generate(controller.orderDetailsModel.length, (index) {
              return TableRow(
                children: [
                  buildTableCell(
                      controller.orderDetailsModel[index].itemsName!),
                  buildTableCell(
                      "${controller.orderDetailsModel[index].cartQuantity}"),
                  buildTableCell(
                      "\$${controller.orderDetailsModel[index].itemsPrice}"),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }