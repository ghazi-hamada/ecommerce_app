import 'build_header_cell.dart';
import 'package:flutter/material.dart';

List<Widget> buildTableHeaders() {
    return [
      buildHeaderCell("Item"),
      buildHeaderCell("Quantity"),
      buildHeaderCell("Price"),
    ];
  }