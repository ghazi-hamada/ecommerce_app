import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/features/NavigationBar_items/nav_bar/controller/nav_bar_controller.dart';
import 'package:ecommerce_app/features/NavigationBar_items/nav_bar/ui/widgets/custom_button_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavBarControllerImpl>(
        builder: (controller) => BottomAppBar(
            color: AppColor.backgroundcolor,
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            child: Row(
              children: [
                ...List.generate(controller.listpages.length + 1, ((index) {
                  int i = index > 2 ? index - 1 : index;
                  return index == 2
                      ? const Spacer()
                      : CustomButtonAppBar(
                          textbutton: controller.titlebottomappbar[i],
                          icondata: controller.iconbottomappbar[i],
                          onPressed: () {
                            controller.changPage(i);
                          },
                          active: controller.currentIndex == i ? true : false);
                }))
              ],
            )));
  }
}
//custom_button_app_bar.dart