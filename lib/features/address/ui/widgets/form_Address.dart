import '../../../../core/functions/validinput.dart';
import '../../../auth/widgets/text_form_field_widget.dart';
import '../../../onboarding/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormAddress extends StatelessWidget {
  var controller;
  final GlobalKey<FormState> formKey;
  FormAddress({super.key, required this.controller, required this.formKey});
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        children: [
          TextFormFieldWidget(
            labeltext: "city",
            icon: const Icon(Icons.location_city_outlined),
            hinttext: "city",
            controller: controller.cityController,
            valid: (p0) => validInput(p0!, InputType.normal),
          ),
          TextFormFieldWidget(
            labeltext: "street",
            icon: const Icon(Icons.location_on_outlined),
            hinttext: "street",
            controller: controller.streetController,
            valid: (p0) => validInput(p0!, InputType.normal),
          ),
          TextFormFieldWidget(
            labeltext: "name",
            icon: const Icon(Icons.location_on_outlined),
            hinttext: "name",
            controller: controller.nameController,
            valid: (p0) => validInput(p0!, InputType.normal),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.h),
            child: CustomButton(
                text: "Save",
                onPress: () {
                  controller.saveAddress();
                }),
          ),
        ],
      ),
    );
  }
}
