import 'package:dartz/dartz.dart';
import '../controller/cart_controller.dart';
import '../data/model/mycart_model.dart';
import 'widgets/order_bottom_sheet_widget.dart';
import 'widgets/shopping_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CartControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        
      ),
      body: Column(
        children: [
          // list Products
          Expanded(
            child: GetBuilder<CartControllerImp>(builder: (controller) {
              return ListView.builder(
                  itemCount: controller.myCart.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: UniqueKey(),
                      onDismissed: (direction) {
                        controller.remove(controller.myCart[index]['items_id']);
                        controller.myCart.removeAt(index);
                      },
                      child: ShoppingCartItem(
                        myCartModel:
                            MycartModel.fromJson(controller.myCart[index]),
                      ),
                    );
                  });
            }),
          ),
          // order_bottom_sheet_widget
          const OrderBottomSheetWidget(),
        ],
      ),
    );
  }
}
