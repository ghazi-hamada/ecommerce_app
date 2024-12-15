class AppApis {
  //====================== Server ======================
  static const String server = 'https://ghaziapp.store/ecommerce_app_backend';

  //====================== Notification ======================
  static const String notification = '$server/notifications.php';

  //====================== Images ======================
  static const String imageStatic = '$server/upload';
  static const String imageCategories = '$imageStatic/categories';
  static const String imageItems = '$imageStatic/items';

  //====================== Testing ======================
  static const String test = '$server/test.php';

  //====================== Authentication ======================
  static const String signUp = '$server/auth/signup.php';
  static const String login = '$server/auth/login.php';
  static const String verifyCodeSignUp = '$server/auth/verifycode.php';
  static const String verifyCodeLogin = '$server/auth/send_verifycode.php';

  //====================== Forget Password ======================
  static const String checkEmail = '$server/forget_password/check_email.php';
  static const String resetPassword =
      '$server/forget_password/reset_password.php';
  static const String verifyCodeForgetPassword =
      '$server/forget_password/verifycode.php';

  //====================== Home ======================
  static const String homepage = '$server/home.php';
  static const String items = '$server/items/items.php';
  static const String search = '$server/items/search.php';

  //====================== Favorites ======================
  static const String favoriteAdd = '$server/favorite/add.php';
  static const String favoriteRemove = '$server/favorite/remove.php';
  static const String favoriteView = '$server/favorite/view.php';
  static const String deleteFromFavorite =
      '$server/favorite/deletefromfavorite.php';
  //====================== Cart ======================
  static const String cartAdd = '$server/cart/add.php';
  static const String cartRemove = '$server/cart/remove.php';
  static const String cartView = '$server/cart/view.php';
  static const String cartEdit = '$server/cart/edit.php';

  //====================== Address ======================
  static const String addressAdd = '$server/address/add.php';
  static const String addressView = '$server/address/view.php';
  static const String addressEdit = '$server/address/edit.php';
  static const String addressDelete = '$server/address/delete.php';

  //====================== Coupon ======================
  static const String checkCoupon = '$server/coupon/checkCoupon.php';

  //====================== Order ======================
  static const String orderCheckout = '$server/orders/checkout.php';
  static const String orderPending = '$server/orders/pending.php';
  static const String orderArchived = '$server/orders/archive.php';
  static const String orderDetails = '$server/orders/details.php';
  static const String orderDelete = '$server/orders/delete.php';
}
