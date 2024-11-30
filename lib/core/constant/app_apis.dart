class AppApis {
  //======================server======================
  static const String server = 'https://ghaziapp.store/ecommerce_app_backend';

  //======================image======================
  static const String imageStatic = '$server/upload';
  static const String imagecategories = '$imageStatic/categories';
  static const String imageItems = '$imageStatic/items';

  //======================test======================
  static const String test = '$server/test.php';

  // ======================auth======================
  static const String signup = '$server/auth/signup.php';
  static const String login = '$server/auth/login.php';
  static const String verfiycodeSignup = '$server/auth/verifycode.php';

  //======================forget password======================
  static const String checkEmail = '$server/forget_password/check_email.php';
  static const String resetPassword =
      '$server/forget_password/reset_password.php';
  static const String verfiyCodeForgetPassword =
      '$server/forget_password/verifycode.php';

  //======================Home=================================
  static const String homepage = '$server/home.php';
  static const String items = '$server/items/items.php';

  //======================favorite=================================
  static const String favoriteAdd = '$server/favorite/add.php';
  static const String favoriteRemove = '$server/favorite/remove.php';
  static const String favoriteView = '$server/favorite/view.php';
  static const String deletefromfavorite =
      '$server/favorite/deletefromfavorite.php';
}
