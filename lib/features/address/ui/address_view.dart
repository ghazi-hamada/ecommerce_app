import '../../../core/class/handling_data_view.dart';
import '../../../core/constant/color.dart';
import '../controller/address_view_controller.dart';
import '../data/model/address_model.dart';
import 'widgets/addressI_item.dart';
import '../../../routes_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AddressViewControllerImpl());
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      appBar: AppBar(
        title: const Text('Address'),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.kAddressAdd);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: GetBuilder<AddressViewControllerImpl>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          child: ListView.builder(
            itemCount: controller.address.length,
            itemBuilder: (context, index) {
              if (controller.address.isEmpty) {
                return const Center(
                  child: Text('No Address'),
                );
              } else {
                return Dismissible(
                  key: UniqueKey(),
                  //
                  confirmDismiss: (direction) async {
                    bool? confirm =
                        await controller.confirmDismissalOutcome(direction);
                    return confirm ?? false;
                  },
                  onDismissed: (direction) {
                    controller.deleteAddress(controller.address[index].id!);
                  },
                  child: AddressItem(addressModel: controller.address[index]),
                );
              }
            },
          ),
        );
      }),
    );
  }
}
