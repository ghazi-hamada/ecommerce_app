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
        title: const Text(
          'Address',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColor.primaryColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColor.primaryColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.kAddressAdd);
        },
        backgroundColor: AppColor.primaryColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: GetBuilder<AddressViewControllerImpl>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          child: controller.address.isEmpty
              ? const Center(
                  child: Text(
                    'No Address',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: controller.address.length,
                  itemBuilder: (context, index) {
                    final address = controller.address[index];
                    return Card(
                      shadowColor: Colors.white,
                      color: Colors.white,
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 3,
                      child: ListTile(
                        leading: const Icon(
                          Icons.location_on,
                          color: AppColor.primaryColor,
                          size: 26,
                        ),
                        title: Text(
                          address.addressName ?? '',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          '${address.addressStreet}, ${address.addressCity}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, AppRoutes.kAddressEdit,
                                    arguments: {
                                      'addressModel': controller.address[index],
                                    });
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () async {
                                bool? confirm =
                                    await controller.confirmDismissalOutcome(
                                        DismissDirection.endToStart);
                                if (confirm ?? false) {
                                  controller.deleteAddress(address.id!);
                                }
                              },
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.kAddressAdd);
                        },
                      ),
                    );
                  },
                ),
        );
      }),
    );
  }
}
