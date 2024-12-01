import 'package:get/get.dart';

class FavoriteController extends GetxController {
  Map<String, int> isFavorite = {};

  setFavorite( id,  value) {
    isFavorite[id] = value; 
    update();
  }
}
