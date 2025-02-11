import 'package:get/get.dart';

import '../../../../core/localization/strings_keys.dart';
import 'build_header_cell.dart';
import 'package:flutter/material.dart';

List<Widget> buildTableHeaders() {
    return [
      buildHeaderCell(StringsKeys.items.tr),
      buildHeaderCell(StringsKeys.quantity.tr),
      buildHeaderCell(StringsKeys.price.tr),
    ];
  }