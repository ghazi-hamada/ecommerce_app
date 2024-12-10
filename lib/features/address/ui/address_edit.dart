import '../../../core/class/handling_data_view.dart';
import '../controller/address_edit_controller.dart';
import 'widgets/form_Address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class AddressEdit extends StatelessWidget {
  const AddressEdit({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AddressEditControllerImpl());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address Edit Details'),
      ),
      body: GetBuilder<AddressEditControllerImpl>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
            child: FormAddress(
              controller: controller,
              formKey: controller.formKey,
            ),
          ),
        );
      }),
    );
  }
}
