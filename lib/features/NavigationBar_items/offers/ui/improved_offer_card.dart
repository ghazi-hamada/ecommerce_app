import 'package:ecommerce_app/features/NavigationBar_items/home/data/models/items_model.dart';
import 'package:ecommerce_app/routes_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/app_apis.dart';
import '../../../../core/functions/translate_database.dart';
import '../../../../core/widgets/custom_price_widget.dart';
import '../controller/offers_controller.dart';
import '../data/model/offer_model.dart';

class ImprovedOfferCard extends GetView<OffersControllerImp> {
  final OfferModel offer;

  const ImprovedOfferCard({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return Banner(
      message: 'Sale',
      location: BannerLocation.topEnd,
      color: Colors.redAccent,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            // الصورة الخلفية للمنتج
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  "${AppApis.imageItems}/${offer.itemsImage!}",
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "${translateDatabase(arabic: offer.itemsNameAr!, english: offer.itemsName!)}",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: CustomPriceWidget(
                      itemsDiscount: offer.itemsDiscount!,
                      itemsPrice: offer.itemsPrice!.toDouble()),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: offer.itemInCart == 1
                        ? null
                        : () {
                            controller.addtocart(offer);
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: offer.itemInCart == 1
                          ? Colors.grey
                          : Colors.redAccent,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Add to Cart',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _calculateDiscountPrice(int? price, int? discount) {
    if (price == null) return '0.0';
    if (discount == null || discount <= 0) return price.toString();
    double discountedPrice = price * (1 - (discount / 100));
    return discountedPrice.toStringAsFixed(2);
  }
}
