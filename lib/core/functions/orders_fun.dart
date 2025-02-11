import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../localization/strings_keys.dart';

printOrderType(int type) {
  if (type == 0) {
    return StringsKeys.delivery.tr;
  } else {
    return StringsKeys.driveThru.tr;
  }
}

Color? statusColor;

String printOrderStatus(int type) {
  switch (type) {
    case 0:
      statusColor = Colors.redAccent; // طلب جديد
      return StringsKeys.newOrder.tr;
    case 1:
      statusColor = Colors.amber;  // قيد المعالجة
      return StringsKeys.processing.tr;
    case 2:
      statusColor = Colors.teal; // في انتظار التوصيل
      return StringsKeys.awaitingDelivery.tr;
    case 3:
      statusColor = Colors.indigo; // جاري التوصيل
      return StringsKeys.outForDelivery.tr;
    case 4:
      statusColor = Colors.green; // مكتمل - في الأرشيف
      return StringsKeys.completedArchived.tr;
    default:
      statusColor = Colors.grey; // حالة غير معروفة
      return StringsKeys.unknownStatus.tr;
  }
}

printPaymentType(int type) {
  if (type == 0) {
    return StringsKeys.cash.tr;
  } else {
    return StringsKeys.card.tr;
  }
}
