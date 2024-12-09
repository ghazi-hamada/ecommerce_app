import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/functions/validinput.dart';
import 'package:ecommerce_app/features/address/controller/add_address_controller.dart';
import 'package:ecommerce_app/features/address/controller/address_add_details_controller.dart';
import 'package:ecommerce_app/features/address/ui/widgets/form_Address.dart';
import 'package:ecommerce_app/features/auth/widgets/text_form_field_widget.dart';
import 'package:ecommerce_app/features/onboarding/ui/widgets/custom_button.dart';
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
