import '../../../../../core/localization/strings_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TextAndSeeAll extends StatelessWidget {
  const TextAndSeeAll({super.key, required this.text, this.onPressed});
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.w500, color: Colors.black, fontSize: 17.sp),
      ),
      const Spacer(),
      TextButton(
        onPressed: onPressed,
        child: Text(StringsKeys.seeAll.tr,
            style: const TextStyle(
                color: Color(0xffFF4747),
                fontWeight: FontWeight.w500,
                fontSize: 15)),
      )
    ]);
  }
}
