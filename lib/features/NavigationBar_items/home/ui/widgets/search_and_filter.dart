import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchAndFilter extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  final void Function() onPressedSearch;
  final void Function() onPressedClear;

  const SearchAndFilter(
      {super.key,
      required this.controller,
      required this.onChanged,
      required this.onPressedSearch,
      required this.onPressedClear});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 11,
          child: SizedBox(
            height: 40.h,
            child: TextFormField(
              controller: controller,
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
                  icon: const Icon(Icons.search,
                      color: Color(0xffD5696E), size: 30),
                ),
                suffixIcon: controller.text.isNotEmpty
                    ? IconButton(
                        onPressed: onPressedClear,
                        icon: const Icon(Icons.clear,
                            color: Color(0xff757779), size: 25),
                      )
                    : null,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: Container(
            width: 30.w,
            height: 40.h,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: const Icon(Icons.filter_list_rounded,
                color: Color(0xffD04142), size: 35),
          ),
        )
      ],
    );
  }
}
