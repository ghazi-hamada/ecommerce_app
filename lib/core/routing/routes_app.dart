import 'package:ecommerce_app/features/auth/forget_password/forget_password_screen.dart';
import 'package:ecommerce_app/features/auth/login/ui/login_screen.dart';
import 'package:ecommerce_app/features/auth/signup/ui/signup_screen.dart';
import 'package:ecommerce_app/features/lang/language_screen.dart';
import 'package:ecommerce_app/features/onboarding/ui/onboarding_screen.dart';
import 'package:get/get.dart';

abstract class AppRoutes {
  // this is the routes name
  static const String kLanguage = '/';
  static const String kOnboarding = '/onboarding';
  static const String kLogin = '/login';
  static const String kSignup = '/signup';
  static const String kForgetPassword = '/forgetpassword';
  static const String kResetpassword = '/resetpassword';
  static const String kSuccessSignup = '/successSignup';
  static const String kSuccessResetPassword = '/successResetPassword';
  static const String kVerfiyCode = '/verfiyCode';
  static const String kVerfiyCodesignup = '/verfiyCodesignup';
  static const String knavbarButton = '/home';
  static const String kItems = '/items';
  static const String kProductDetails = '/productDetails';
  static const String kMyFavorite = '/MyFavorite';

  // this is the routes list
  static List<GetPage<dynamic>> getPages = [
    GetPage(
        name: kLanguage,
        page: () => const LanguageScreen()), // const OnboardingScreen()),
    GetPage(name: kOnboarding, page: () => const OnboardingScreen()),
    GetPage(name: kLogin, page: () => const LoginScreen()),
    GetPage(name: kSignup, page: () => const SignupScreen()),
    GetPage(name: kForgetPassword, page: () => const ForgetPasswordScreen()),
  ];
}
