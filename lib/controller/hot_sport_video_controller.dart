import 'package:get/get.dart';
import 'package:hot_sport/hot_sport.dart';

// abstract class TabBarBadgeDelegate {
//   int getCurrentCategoryMenuCount({required String title});
// }

class HotSportVideoController extends GetxController {
  List<String> urls = [];

  void stopAll() {
    //..
    urls.clear();
    update();
  }

  bool play({required String url}) => urls.contains(url);
  // TabBarBadgeDelegate? delegate;

  // int getBadgeCountWithTitle(String title) {
  //   if (delegate != null) {
  //     return delegate!.getCurrentCategoryMenuCount(title: title);
  //   }
  //   return 0;
  // }

  // void updateMneuCount({required String? title}) {
  //   if (title == null) {
  //     updateAll();
  //   } else {
  //     update([title]);
  //   }
  // }

  // VoidCallback? updateAllBadge;
  // void updateAll() {
  //   if (updateAllBadge != null) {
  //     updateAllBadge!();
  //   }
  // }
}
