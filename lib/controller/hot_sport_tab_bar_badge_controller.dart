part of hot_sport;

abstract class TabBarBadgeDelegate {
  int getCurrentCategoryMenuCount({required String title});
}

class HotSportTabBarBadgeController extends GetxController {
  TabBarBadgeDelegate? delegate;

  int getBadgeCountWithTitle(String title) {
    if (delegate != null) {
      return delegate!.getCurrentCategoryMenuCount(title: title);
    }
    return 0;
  }

  void updateMneuCount({required String? title}) {
    if(title == null) {
      updateAll();
    }else {
      update([title]);
    }
  }
  void updateAll() => update();
}
