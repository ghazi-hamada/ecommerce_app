import '../../../../../core/constant/color.dart';
import 'package:flutter/material.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({
    super.key,
    required this.body,
    required this.action,
    required this.onPressAction,
  });
  final String body;
  final String action;
  final void Function() onPressAction;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(body),
        InkWell(
          onTap: onPressAction,
          child: Text(
            action,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.primaryColor, fontSize: 13),
          ),
        )
      ],
    );
  }
}
