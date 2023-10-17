import 'package:get/get.dart';
import 'package:hot_sport/hot_sport.dart';
class ShopCartController extends GetxController {
  ShopCartController({this.hotSportModel});

  HotSportModel? hotSportModel;

  RxInt count = 0.obs;
  RxString price = ''.obs;

  final String defaultBgImageUrl = '';
  final double defaultTextFontSize = 15;
  final String defaultBgHexColor = 'ffffff';

  void reSet() {}
}
