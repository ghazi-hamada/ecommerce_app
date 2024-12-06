import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BodyWidget extends StatelessWidget {
const BodyWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return SizedBox(
            width: double.infinity,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50.h,
                ),
                ListTile(
                    trailing: Switch(value: false, onChanged: (value) {}),
                    title: const Text(
                      "Disable Notification",
                    )),
                ListTile(
                    trailing: Icon(
                      Icons.location_on_outlined,
                      size: 26.sp,
                    ),
                    title: const Text(
                      "Address",
                    )),
                ListTile(
                    trailing: Icon(
                      Icons.help_outline_rounded,
                      size: 26.sp,
                    ),
                    title: const Text(
                      "About Us",
                    )),
                ListTile(
                    trailing: Icon(
                      Icons.phone_callback_outlined,
                      size: 26.sp,
                    ),
                    title: const Text(
                      "Contact Us",
                    )),
                ListTile(
                    trailing: Icon(
                      Icons.logout,
                      size: 26.sp,
                    ),
                    title: const Text(
                      "Logout",
                    )),
              ],
            ),
          );
  }
}