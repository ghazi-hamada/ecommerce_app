import 'package:ecommerce_app/features/auth/login/ui/login_screen.dart';
import 'package:ecommerce_app/features/onboarding/ui/onboarding_screen.dart';
import 'package:get/get.dart';

abstract class AppRoutes {
  // this is the routes name
  static const String kOnboarding = '/Onboarding';
  static const String kLogin = '/login';
  static const String kSignup = '/signup';
  static const String kForgetPassword = '/forgetpassword';
  static const String kResetpassword = '/resetpassword';
  static const String kSuccessSignup = '/successSignup';
  static const String kSuccessResetPassword = '/successResetPassword';
  static const String kVerfiyCode = '/verfiyCode';
  static const String kVerfiyCodesignup = '/verfiyCodesignup';
  static const String knavbarButton = '/home';
  static const String kLanguage = '/';
  static const String kItems = '/items';
  static const String kProductDetails = '/productDetails';
  static const String kMyFavorite = '/MyFavorite';

  // this is the routes list
  static List<GetPage<dynamic>> getPages = [
    GetPage(name: kOnboarding, page: () => const OnboardingScreen()),
    GetPage(name: kLogin, page: () => const LoginScreen()),
  ];
}
