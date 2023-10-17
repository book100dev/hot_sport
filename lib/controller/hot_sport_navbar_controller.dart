import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hot_sport/data/listener_details.dart';
import 'package:hot_sport/data/navbar_config.dart';
import 'package:hot_sport/hot_sport.dart';

abstract class HotSportNavBarListener {
  factory HotSportNavBarListener.creat() => HotSportNavBarNotifier();
  //监听内容
  ValueListenable<ListenerDetails> get valueDetails;
}

class HotSportNavBarNotifier implements HotSportNavBarListener {
  @override
  //返回监听内容
  ValueNotifier<ListenerDetails> valueDetails =
      ValueNotifier(ListenerDetails(index: 0,previousIndex: 0));
}

class HotSportNavBarController extends GetxController implements HotSportNavBarListener{
  HotSportNavBarController({this.hotSportModel, this.titles,this.currentIndex = 0,this.hotSportNavBarNotifier});
  NavBarConfig config = NavBarConfig();
  HotSportModel? hotSportModel;
  List<String>? titles;
  HotSportNavBarNotifier? hotSportNavBarNotifier;
  int currentIndex;
  TabController? tabController;
 

  void reSet() {
    config = NavBarConfig();
  }

  set index(_) {
    if(tabController == null) return;
    hotSportNavBarNotifier?.valueDetails.value = ListenerDetails(index:_,previousIndex: tabController!.previousIndex);
  }

  @override
  ValueNotifier<ListenerDetails> valueDetails =
      ValueNotifier(ListenerDetails(index: 0,previousIndex: 0));
 
}
