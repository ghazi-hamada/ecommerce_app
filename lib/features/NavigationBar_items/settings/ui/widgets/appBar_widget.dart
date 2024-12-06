import 'package:ecommerce_app/core/localization/strings_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppBarWidget extends StatelessWidget {
const AppBarWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10, top: 15),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    StringsKeys.settings.tr,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ahmed Mohamed",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Admin",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    )
                  ],
                )
              ],
            ),
          );
  }
}