import 'package:ecommerce_app/core/localization/strings_keys.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';

enum InputType { username, email, phone, password }

String? validInput(String val, InputType type) {
  if (val.isEmpty) {
    return StringsKeys.fieldEmpty.tr; // استخدام الترجمة هنا
  }

  if (val.length < 8) {
    return StringsKeys.inputTooShort.tr;
  }

  if (val.length > 100) {
    return StringsKeys.inputTooLong.tr;
  }

  switch (type) {
    case InputType.username:
      if (!GetUtils.isUsername(val)) {
        return StringsKeys.invalidUsername.tr;
      }
      break;

    case InputType.email:
      if (!GetUtils.isEmail(val)) {
        return StringsKeys.invalidEmail.tr;
      }
      break;

    case InputType.phone:
      if (!GetUtils.isPhoneNumber(val)) {
        return StringsKeys.invalidPhone.tr;
      }
      break;

    case InputType.password:
      if (val.length < 8) {
        return StringsKeys.passwordTooShort.tr;
      }
      if (!RegExp(r'[A-Z]').hasMatch(val)) {
        return StringsKeys.passwordUppercase.tr;
      }
      if (!RegExp(r'[a-z]').hasMatch(val)) {
        return StringsKeys.passwordLowercase.tr;
      }
      if (!RegExp(r'[0-9]').hasMatch(val)) {
        return StringsKeys.passwordDigit.tr;
      }
      break;
  }

  return null;
}
