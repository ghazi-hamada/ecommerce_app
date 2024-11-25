import 'package:ecommerce_app/core/constant/image_asset.dart';
import 'package:ecommerce_app/features/onboarding/data/models/onboarding_model.dart';
import 'package:get/get.dart';

List<OnBoardingModel> onBoardingData = [
  OnBoardingModel(
    title: "Choose Product",
    description:
        "We Have a 100K+ Products. Choose Your product from our E-commerce shop.",
    image: AppImageAsset.onBoardingImage4,
  ),
  OnBoardingModel(
    title: "Easy & Safe Payment",
    description:
        "Easy Checkout & Safe Payment method. Trusted by our Customers from all over the world.",
    image: AppImageAsset.onBoardingImage1,
  ),
  OnBoardingModel(
    title: "Track Your Order",
    description:
        "Best Tracker has been Used For Track your order. You'll know where your product is at the moment.",
    image: AppImageAsset.onBoardingImage2,
  ),
  OnBoardingModel(
    title: "Fast Delivery",
    description:
        "Reliable And Fast Delivery. We Deliver your product the fastest way possible.",
    image: AppImageAsset.onBoardingImage3,
  ),
];
