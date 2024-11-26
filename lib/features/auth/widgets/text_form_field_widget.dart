import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    this.controller,
    required this.labeltext,
    required this.icon,
    required this.hinttext,
    required this.valid,
    this.obsText,
    this.onTapIcon,
    this.keyboardType,
  });

  final TextEditingController? controller;
  final String labeltext;
  final String hinttext;
  final Widget? icon;
  final String? Function(String?) valid;
  final bool? obsText;
  final TextInputType? keyboardType;
  final void Function()? onTapIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: TextFormField(
            keyboardType: keyboardType,
            obscureText: obsText == null || obsText == false ? false : true,
            validator: valid,
            controller: controller,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColor.primaryColor,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
              hintText: hinttext,
              hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.normal),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              label: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(labeltext,
                      style: const TextStyle(
                          color: AppColor.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold))),
              suffixIcon: InkWell(
                onTap: onTapIcon,
                child: icon,
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(45.0),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}
