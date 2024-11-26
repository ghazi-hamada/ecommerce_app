import 'package:ecommerce_app/core/constant/image_asset.dart';
import 'package:ecommerce_app/features/onboarding/data/models/onboarding_model.dart';
import 'package:get/get.dart';

List<OnBoardingModel> onBoardingData = [
  OnBoardingModel(
    title: "Choose Product",
    description:
        "We Have a 100K+ Products. Choose\n Your product from our\n E-commerce shop.",
    image: AppImageAsset.onBoardingImage4,
  ),
  OnBoardingModel(
    title: "Easy & Safe Payment",
    description:
        "Easy Checkout & Safe Payment\n method. Trusted by our Customers\n from all over the world.",
    image: AppImageAsset.onBoardingImage1,
  ),
  OnBoardingModel(
    title: "Track Your Order",
    description:
        "Best Tracker has been Used For\n Track your order. You'll know where\n your product is at the moment.",
    image: AppImageAsset.onBoardingImage2,
  ),
  OnBoardingModel(
    title: "Fast Delivery",
    description:
        "Reliable And Fast Delivery. We\n Deliver your product the fastest\n way possible.",
    image: AppImageAsset.onBoardingImage3,
  ),
];
