import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomSliderItem extends StatelessWidget {
  const CustomSliderItem({super.key, required this.item});
  final Map<String, String> item;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Stack(
            children: [
              // الخلفية (الصورة)
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl: item["image"]!,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
              ),
              // المحتوى فوق الصورة
              // Positioned(
              //   top: 16,
              //   left: 16,
              //   child: Container(
              //     padding:
              //         const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              //     decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.circular(8),
              //     ),
              //     child: const Text(
              //       "Limited time!",
              //       style: TextStyle(
              //         fontSize: 14,
              //         fontWeight: FontWeight.bold,
              //         color: Colors.redAccent,
              //       ),
              //     ),
              //   ),
              // ),
              Positioned(
                top: 16,
                left: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item["title"]!,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      item["subtitle"]!,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                      ),
                    ),
                    Text(
                      item["details"]!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              // Positioned(
              //   bottom: 16,
              //   right: 16,
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //       iconColor: Colors.redAccent, // لون الزر
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(12),
              //       ),
              //     ),
              //     onPressed: () {
              //       // أكشن عند الضغط
              //       print("Claim clicked!");
              //     },
              //     child: const Text(
              //       "Claim",
              //       style: TextStyle(
              //         fontWeight: FontWeight.bold,
              //         color: Color(0xffFF4747),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }
}
