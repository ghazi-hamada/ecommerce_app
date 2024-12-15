import '../../../core/class/handling_data_view.dart';
import '../controller/address_add_details_controller.dart';
import 'widgets/form_Address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddressAddDetails extends StatelessWidget {
  const AddressAddDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AddressAddDetailsControllerImpl());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address Add Details'),
      ),
      body: GetBuilder<AddressAddDetailsControllerImpl>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
            child: FormAddress(
                controller: controller, formKey: controller.formKey),
          ),
        );
      }),
    );
  }
}
