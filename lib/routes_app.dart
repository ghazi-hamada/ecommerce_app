import 'features/notifications/ui/notification_screen.dart';
import 'features/orders/ui/archive_screen.dart';
import 'features/orders/ui/pending_screen.dart';
import 'features/orders_details/ui/orders_details_screen.dart';

import 'features/NavigationBar_items/settings/ui/settings_screen.dart';
import 'features/address/ui/address_add.dart';
import 'features/address/ui/address_add_details.dart';
import 'features/address/ui/address_edit.dart';
import 'features/address/ui/address_view.dart';
import 'features/auth/activate_account/ui/activate_account_screen.dart';
import 'features/NavigationBar_items/my_favorite/ui/my_favorite_screen.dart';
import 'features/checkout/ui/checkout_screen.dart';
import 'package:get/get.dart';
import 'core/middleware/my_middleware.dart';
import 'features/auth/login/ui/login_screen.dart';
import 'features/auth/signup/ui/signup_screen.dart';
import 'features/auth/sucsses_signup/sucsess_signup_screen.dart';
import 'features/auth/verify_code_signup/verify_code_signup_Screen.dart';
import 'features/forget_password/forget_password/forget_password_screen.dart';
import 'features/forget_password/reset_password/reset_password_screen.dart';
import 'features/forget_password/success_reset_password/success_reset_password_screen.dart';
import 'features/forget_password/verifycode/verifycode_screen.dart';
import 'features/items/ui/items_screen.dart';
import 'features/lang/language_screen.dart';
import 'features/NavigationBar_items/nav_bar/ui/nav_bar.dart';
import 'features/onboarding/ui/onboarding_screen.dart';
import 'features/product_details/ui/product_details.dart';
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
  static const String kCart = '/Cart';
  //Address
  static const String kAddressAdd = '/addressAdd';
  static const String kAddressAddDetails = '/addressAddDetails';
  static const String kAddressEdit = '/addressEdit';
  static const String kAddressView = '/addressView';
  // checkout
  static const String kCheckout = '/checkout';

  // orders
  static const String kpending = '/pending';
  static const String karchived = '/archived';
  static const String korderDetails = '/orderDetails';
  // notification
  static const String kNotification = '/notification';

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
    //Address
    GetPage(name: kAddressAdd, page: () => const AddressAdd()),
    GetPage(name: kAddressAddDetails, page: () => const AddressAddDetails()),
    GetPage(name: kAddressEdit, page: () => const AddressEdit()),
    GetPage(name: kAddressView, page: () => const AddressView()),
    GetPage(name: kCheckout, page: () => const CheckoutScreen()),
    GetPage(name: kpending, page: () => const PendingScreen()),
    GetPage(name: karchived, page: () => const ArchiveScreen()),
    GetPage(name: kNotification, page: () => const NotificationScreen()),
    GetPage(name: korderDetails, page: () => const OrdersDetailsScreen()),
  ];
}
