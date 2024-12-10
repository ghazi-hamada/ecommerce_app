import 'dart:math';

import '../localization/strings_keys.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';

enum InputType { username, email, phone, password, confirmPassword, normal }

String? validInput(String val, InputType type) {
  if (val.isEmpty) {
    if (type == InputType.username) {
      return StringsKeys.usernameRequired.tr; //يرجى إدخال اسمك الكامل
    } else if (type == InputType.phone) {
      return StringsKeys.phoneRequired.tr; //يرجى إدخال رقم الجوال
    } else if (type == InputType.email) {
      return StringsKeys.emailRequired.tr; //يرجى إدخال البريد الألكتروني
    } else if (type == InputType.password) {
      return StringsKeys.passwordRequired.tr; //يرجى إدخال كلمة المرور
    } else if (type == InputType.confirmPassword) {
      return StringsKeys
          .confirmPasswordRequired.tr; //يرجى إدخال تأكيد كلمة المرور
    }
  }

  if (val.length < 3) {
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
    case InputType.confirmPassword:
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
    case InputType.normal:
      break;
  }

  return null;
}
