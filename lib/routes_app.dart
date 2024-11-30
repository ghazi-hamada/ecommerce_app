import 'package:ecommerce_app/core/middleware/my_middleware.dart';
import 'package:ecommerce_app/features/forget_password/forget_password/forget_password_screen.dart';
import 'package:ecommerce_app/features/auth/login/ui/login_screen.dart';
import 'package:ecommerce_app/features/forget_password/reset_password/reset_password_screen.dart';
import 'package:ecommerce_app/features/auth/signup/ui/signup_screen.dart';
import 'package:ecommerce_app/features/forget_password/success_reset_password/success_reset_password_screen.dart';
import 'package:ecommerce_app/features/auth/sucsses_signup/sucsess_signup_screen.dart';
import 'package:ecommerce_app/features/auth/verify_code_signup/verify_code_signup_Screen.dart';
import 'package:ecommerce_app/features/forget_password/verifycode/verifycode_screen.dart';
import 'package:ecommerce_app/features/home/ui/home_screen.dart';
import 'package:ecommerce_app/features/items/ui/items_screen.dart';
import 'package:ecommerce_app/features/lang/language_screen.dart';
import 'package:ecommerce_app/features/nav_bar/ui/nav_bar.dart';
import 'package:ecommerce_app/features/onboarding/ui/onboarding_screen.dart';
import 'package:ecommerce_app/features/product_details/ui/product_details.dart';
import 'package:ecommerce_app/features/test/ui/test_screen.dart';
import 'package:get/get.dart';

abstract class AppRoutes {
  // this is the routes name
  static const String kLanguage = '/';
  static const String kOnboarding = '/onboarding';
  static const String kNavBar = '/NavBar';
  static const String kLogin = '/login';
  static const String kSignup = '/signup';
  static const String kForgetPassword = '/forgetpassword';
  static const String kResetpassword = '/resetpassword';
  static const String kSuccessSignup = '/successSignup';
  static const String kSuccessResetPassword = '/successResetPassword';
  static const String kVerfiyCode = '/verfiyCode';
  static const String kVerfiyCodesignup = '/verfiyCodesignup';
  static const String khome = '/home';
  static const String kItems = '/items';
  static const String kProductDetails = '/productDetails';
  static const String kMyFavorite = '/MyFavorite';

  // this is the routes list
  static List<GetPage<dynamic>> getPages = [
    // GetPage(name: '/', page: () => const TestScreen()),
    GetPage(
        name: kLanguage,
        page: () => const LanguageScreen(),
        middlewares: [MyMiddleware()]),
    GetPage(name: kOnboarding, page: () => const OnboardingScreen()),
    GetPage(name: kLogin, page: () => const LoginScreen()),
    GetPage(name: kSignup, page: () => const SignupScreen()),
    GetPage(name: kForgetPassword, page: () => const ForgetPasswordScreen()),
    GetPage(name: kVerfiyCode, page: () => const VerifyCodeScreen()),
    GetPage(name: kItems, page: () => const ItemsScreen()),
    GetPage(name: kVerfiyCodesignup, page: () => VerifyCodeSignUpScreen()),
    GetPage(name: kResetpassword, page: () => const ResetPasswordScreen()),
    GetPage(name: kSuccessSignup, page: () => const SuccessSignUp()),
    GetPage(
        name: kSuccessResetPassword, page: () => const SuccessResetPassword()),
    GetPage(name: khome, page: () => const NavBar()),
    GetPage(name: kProductDetails, page: () => const ProductDetailsScreen()),
  ];
}
