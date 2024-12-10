
import '../../../../../core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDesign extends StatelessWidget {
  const CustomDesign(
      {super.key, required this.child, required this.childAppbar});
  final Widget child;
  final Widget childAppbar;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColor.primaryColor, Colors.red],
              begin: Alignment.topCenter,
              end: Alignment.center,
            ),
          ),
          child: childAppbar,
        ),
        Positioned(
          top: -50,
          right: -50,
          child: CircleAvatar(
            radius: 100,
            backgroundColor: Colors.white.withOpacity(0.1),
          ),
        ),
        Positioned(
          top: 100,
          left: -30,
          child: CircleAvatar(
            radius: 80,
            backgroundColor: Colors.white.withOpacity(0.1),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.55.h,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: child,
          ),
        ),
      ],
    );
  }
}
//ghazihamada7@gmail.com