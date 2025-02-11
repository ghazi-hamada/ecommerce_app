import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/search_controller.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget(
      {super.key,
      required this.onChanged,
      required this.onPressedSearch,
      required this.onPressedClear,
      required this.searchController});
  final Function(String) onChanged;
  final void Function() onPressedSearch;
  final void Function() onPressedClear;
  final TextEditingController searchController;
  @override
  Widget build(BuildContext context) {
     return SizedBox(
      height: 40.h,
      child: TextFormField(
        controller: searchController,
        onChanged: onChanged,
        cursorHeight: 20,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          hintText: "Search",
          hintStyle: const TextStyle(
            color: Color(0xff757779),
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
          prefixIcon: IconButton(
            onPressed: onPressedSearch,
            icon: const Icon(Icons.search, color: Color(0xffD5696E), size: 30),
          ),
          suffixIcon: searchController.text.isNotEmpty
              ? IconButton(
                  onPressed: onPressedClear,
                  icon: const Icon(Icons.clear,
                      color: Color(0xff757779), size: 25),
                )
              : null,
        ),
      ),
    );
  }
}
