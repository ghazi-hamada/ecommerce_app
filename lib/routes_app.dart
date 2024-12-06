import 'package:ecommerce_app/features/NavigationBar_items/settings/ui/settings_screen.dart';
import 'package:ecommerce_app/features/auth/activate_account/ui/activate_account_screen.dart';
import 'package:ecommerce_app/features/NavigationBar_items/my_favorite/ui/my_favorite_screen.dart';
import 'package:get/get.dart';

import 'package:ecommerce_app/core/middleware/my_middleware.dart';
import 'package:ecommerce_app/features/auth/login/ui/login_screen.dart';
import 'package:ecommerce_app/features/auth/signup/ui/signup_screen.dart';
import 'package:ecommerce_app/features/auth/sucsses_signup/sucsess_signup_screen.dart';
import 'package:ecommerce_app/features/auth/verify_code_signup/verify_code_signup_Screen.dart';
import 'package:ecommerce_app/features/forget_password/forget_password/forget_password_screen.dart';
import 'package:ecommerce_app/features/forget_password/reset_password/reset_password_screen.dart';
import 'package:ecommerce_app/features/forget_password/success_reset_password/success_reset_password_screen.dart';
import 'package:ecommerce_app/features/forget_password/verifycode/verifycode_screen.dart';
import 'package:ecommerce_app/features/items/ui/items_screen.dart';
import 'package:ecommerce_app/features/lang/language_screen.dart';
import 'package:ecommerce_app/features/NavigationBar_items/nav_bar/ui/nav_bar.dart';
import 'package:ecommerce_app/features/onboarding/ui/onboarding_screen.dart';
import 'package:ecommerce_app/features/product_details/ui/product_details.dart';

import 'features/NavigationBar_items/cart/ui/cart_screen.dart';

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
  static const String kActivateAccount = '/ActivateAccount';
  static const String khome = '/home';
  static const String kItems = '/items';
  static const String kProductDetails = '/productDetails';
  static const String kMyFavorite = '/MyFavorite';
  static const String kSettings = '/Settings';
  static const String kCart  = '/Cart';

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
    GetPage(
        name: kVerfiyCodesignup, page: () => const VerifyCodeSignUpScreen()),
    GetPage(name: kResetpassword, page: () => const ResetPasswordScreen()),
    GetPage(name: kSuccessSignup, page: () => const SuccessSignUp()),
    GetPage(
        name: kSuccessResetPassword, page: () => const SuccessResetPassword()),
    GetPage(name: khome, page: () => const NavBar()),
    GetPage(name: kProductDetails, page: () => const ProductDetailsScreen()),
    GetPage(name: kMyFavorite, page: () => const MyFavoriteScreen()),
    GetPage(name: kActivateAccount, page: () => const ActivateAccountScreen()),
    GetPage(name: kSettings, page: () => const SettingsScreen()),
    GetPage(name: kCart, page: () => const CartScreen()),
  ];
}
