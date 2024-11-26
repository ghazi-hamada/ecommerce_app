import 'package:ecommerce_app/core/constant/image_asset.dart';
import 'package:ecommerce_app/core/localization/strings_keys.dart';
import 'package:ecommerce_app/features/onboarding/data/models/onboarding_model.dart';
import 'package:get/get.dart';

List<OnBoardingModel> onBoardingData = [
  OnBoardingModel(
    title: StringsKeys.chooseProduct.tr,
    description:
       StringsKeys.productDescription.tr,
    image: AppImageAsset.onBoardingImage4,
  ),
  OnBoardingModel(
    title: StringsKeys.easyPayment.tr,
    description:
        StringsKeys.paymentDescription.tr,
    image: AppImageAsset.onBoardingImage1,
  ),
  OnBoardingModel(
    title: StringsKeys.trackOrder.tr,
    description:
        StringsKeys.trackDescription.tr,
    image: AppImageAsset.onBoardingImage2,
  ),
  OnBoardingModel(
    title: StringsKeys.fastDelivery.tr,
    description:
        StringsKeys.deliveryDescription.tr,
    image: AppImageAsset.onBoardingImage3,
  ),
];
