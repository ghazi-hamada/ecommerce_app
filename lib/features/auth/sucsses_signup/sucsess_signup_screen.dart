import '../../../core/localization/strings_keys.dart';
import 'controller/sucsess_signup_controller.dart';
import '../../onboarding/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignupControllerImp controller =
        Get.put(SuccessSignupControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(StringsKeys.success.tr,
            style: const TextStyle(color: AppColor.grey)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(children: [
            const Icon(
              Icons.check_circle_outline,
              color: AppColor.primaryColor,
              size: 200,
            ),
            //
            Text(
              StringsKeys.congratulations.tr,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 25),
            ),
            Text(
              StringsKeys.registeredSuccessfully.tr,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Spacer(),
            CustomButton(
              text: StringsKeys.done.tr,
              onPress: () {
                controller.gotologin();
              },
            ),
            const SizedBox(
              height: 30,
            )
          ]),
        ),
      ),
    );
  }
}
