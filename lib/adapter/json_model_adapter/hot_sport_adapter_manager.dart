// import 'dart:async';
// import 'dart:ui';

// import 'package:flutter/material.dart';

// import 'hot_sport_request.dart';
// import 'hot_sport_response.dart';

part of hot_sport;

class Adaptee {
  HotSportResponse concreteOperator() {
    return HotSportResponse();
  }
}

abstract class ITarget {
  HotSportResponse response();
}

class ObjectAdapter implements ITarget {
  var adaptee = Adaptee();
  HotSportRequest? request;

  @override
  HotSportResponse response() {
    return adaptee.concreteOperator();
  }
}

class HotSportService {
  // Map<dynamic, HotSportBuilder>? _hotSportBuilders;
  // void registerCustomHotSportBuilders(Map<dynamic, HotSportBuilder> builders) {
  //   _hotSportBuilders = builders;
  // }

  //Map<dynamic, ObjectAdapter>? _adapters;

  Map<dynamic, HotSportBuilder>? hotSportBuilder;
  void registerCustomHotSportBuilders(Map<dynamic, HotSportBuilder> builders) {
    hotSportBuilder = builders;
  }

  dynamic getGestureAdapter<R>({
    dynamic variant,
    BuildContext? context,
    HotSportRequest? request,
  }) {
    HotSportBuilder? customHostSportBuilder = hotSportBuilder?[1000];
    if (customHostSportBuilder == null) {
      return null;
    }
    ObjectAdapter? gestureAdapter =
        customHostSportBuilder(completeHotSportResponse);
    gestureAdapter.request = request;
    return gestureAdapter.response();
  }

  dynamic geTargetAdapter<R>({
    dynamic variant,
    HotSportRequest? request,
  }) {
    HotSportBuilder? customHostSportBuilder = hotSportBuilder?[variant];
    if (customHostSportBuilder == null) {
      return null;
    }
    ObjectAdapter? objectAdapter =
        customHostSportBuilder(completeHotSportResponse);
    objectAdapter.request = request;
    return objectAdapter.response();
  }

  // Widget? linkHotSportWidget<R>({dynamic variant, R? data, String? content}) {
  //   assert(
  //     _hotSportBuilders != null,
  //     'You have to call registerCustomHotSportBuilders to use this function.',
  //   );

  //   final customDialogUI = _hotSportBuilders?[variant];
  //   if (customDialogUI == null) {
  //     return null;
  //   }

  //   // assert(
  //   //   customDialogUI != null,
  //   //   'You have to call registerCustomDialogBuilder to use this function. Look at the custom dialog UI section in the stacked_services readme.',
  //   // );
  //   return Builder(
  //       builder: (BuildContext context) => customDialogUI(
  //             context,
  //             HotSprotRequest<R>(
  //               content: content,
  //               data: data,
  //               variant: variant,
  //             ),
  //             completeDialog,
  //           ));
  // }

  void completeHotSportResponse(HotSportResponse response) {
    print('HotSportResponse----- print');
  }
  //添加一些代理事件

  // Future<T?> xxxxxxxxxxx<T>({
  //   required WidgetBuilder widgetBuilder,
  // }) {

  //   return  PrintHandler<T>();
  // }
}
