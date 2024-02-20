library hot_sport;

import 'dart:io';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:hot_sport/extension/hex_color.dart';
import 'package:hot_sport/extension/snapshot_ext.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';
import 'package:extended_image/extended_image.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_win/video_player_win.dart';
import 'package:badges/badges.dart' as sbadges;

import 'adapter/json_model_adapter/box_request.dart';
import 'adapter/json_model_adapter/box_response.dart';
import 'adapter/json_model_adapter/food_interface.dart';
import 'adapter/json_model_adapter/json_model_type_adapter.dart';
import 'adapter/json_model_adapter/json_model_type_registry.dart';
import 'controller/hot_sport_navbar_controller.dart';
import 'controller/hot_sport_shop_cart_controller.dart';
// import 'data/food_theme.dart';
import 'data/sport_model_event.dart';
import 'data/sport_molde_background.dart';
import 'data/sport_molde_food.dart';
import 'data/sport_molde_position.dart';
import 'data/sport_molde_size_style.dart';
import 'data/sport_molde_text_style.dart';
import 'data/sport_molde_box_decoration.dart';
import 'mixin/hot_sport_widget_box_mixin.dart';
import 'mixin/hot_sport_widget_text_mixin.dart';
// import 'mixin/hot_sport_action_mixin.dart';

part 'adapter/json_model_adapter/food_json_model_interface.dart';

part 'widget_info.dart';

part 'base/hot_sport_widget.dart';

// part 'base/componet.dart';

part 'controller/hot_sport_tab_bar_badge_controller.dart';
part 'data/componet_type.dart';
part 'data/global_theme.dart';
part 'mixin/base_componet_bean.dart';
part 'adapter/controller/hot_sport_food_controller.dart';
part 'widgets/hot_sport_button.dart';
part 'widgets/hot_sport_food_button.dart';
part 'widgets/hot_sport_food_image.dart';
part 'widgets/hot_sport_image.dart';
part 'widgets/hot_sport_bg_image.dart';
part 'widgets/hot_sport_food_name_text.dart';
part 'widgets/hot_sport_text.dart';
part 'widgets/hot_sport_search.dart';
part 'widgets/hot_sport_unit_text.dart';
part 'widgets/hot_sport_price_text.dart';
part 'widgets/hot_sport_vip_price_text.dart';
part 'widgets/hot_sport_write_text.dart';
part 'widgets/hot_spot_lottie.dart';
part 'widgets/hot_sport_video.dart';
part 'widgets/hot_sport_table.dart';
part 'widgets/hot_sport_div.dart';
part 'widgets/hot_sport_image_button.dart';
part 'widgets/hot_sport_navbar.dart';
part 'widgets/hot_sport_shop_cart.dart';
part 'widgets/hot_sport_shop_cart_icon_button.dart';
part 'widgets/hot_sport_shop_cart_rounded.dart';

part 'package:hot_sport/base/componet_option.dart';
part 'hot_sport_model.dart';
part 'adapter/json_model_adapter/hot_sport_adapter_manager.dart';
part 'adapter/json_model_adapter/hot_sport_request.dart';
part 'adapter/json_model_adapter/hot_sport_response.dart';

part 'extension/hot_sport_model_ext.dart';

typedef HotSportBuilder = ObjectAdapter Function(
    void Function(HotSportResponse));

abstract class HotSportInterface {
  void registerCustomHotSportBuilders(Map<dynamic, HotSportBuilder> builders);
  void registerModelAdapter<T>(JsonModelTypeAdapter<T> adapter);
  Widget? hookIDETargetWidget(
      dynamic componetType, HotSportRequest hotSprotRequest);
  Widget hotSportLayoutBuilder(dynamic componetType, BuildContext context,
      HotSportRequest hotSprotRequest);

  Widget screenshot(HotSportModel? hotSportModel);
  //..
  void initGlobalThemeData(GlobalThemeData? data);

  GlobalThemeData? globalThemeData();

  bool get isHotSportBuildersRegistered;

  // HostSportBuilder hostSportBuilder
}

class HotSportImpl extends HotSportInterface {
  HotSportImpl() {
    getIt.registerSingleton<HotSportService>(HotSportService(),
        signalsReady: true);
  }
  GetIt getIt = GetIt.instance;
  GlobalThemeData? _globalThemeData;

  HotSportResponse<T>? _showGestureAdaptee<T>(dynamic componetType,
      BuildContext context, HotSportRequest hotSprotRequest) {
    var gestureAdaptee = getIt<HotSportService>().getGestureAdapter(
        variant: componetType, context: context, request: hotSprotRequest);
    return gestureAdaptee;
  }

  @override
  void registerModelAdapter<T>(JsonModelTypeAdapter adapter) {
    // if (!jsonConvert.isAdapterRegistered(T)) {
    //   //已经注册不再重复注册
    //   return;
    // }
    jsonConvert.registerAdapter(adapter);
  }

  @override
  Widget screenshot(HotSportModel? hotSportModel) {
    Widget? widget =
        hotSportModel?.widgetInfo?.build(hotSportModel.componetOption!);
    List<Widget> subWidgets = [];
    hotSportModel?.components?.forEach((subHotSportModel) {
      Widget? sub =
          subHotSportModel.widgetInfo?.build(subHotSportModel.componetOption!);
      if (sub != null) {
        subWidgets.add(sub);
      }
      subHotSportModel.components?.forEach((_) {
        Widget? sub = _.widgetInfo?.build(_.componetOption!);
        if (sub != null) {
          subWidgets.add(Stack(children: [sub]));
        }
        _.components?.forEach((os) {
          Widget? sub = os.widgetInfo?.build(os.componetOption!);
          if (sub != null) {
            subWidgets.add(Stack(children: [sub]));
          }
        });
      });
    });
    return Stack(children: [
      widget!,
      hotSportModel?.components != null
          ? Stack(children: subWidgets)
          : Container()
    ]);
  }

  @override
  Widget hotSportLayoutBuilder(dynamic componetType, BuildContext context,
      HotSportRequest hotSprotRequest) {
    HotSportResponse? response =
        _showGestureAdaptee(componetType, context, hotSprotRequest);

    HotSportModel? hotSportModel = hotSprotRequest.data;
    Widget? widget = response != null
        ? response.data
        : hotSportModel?.widgetInfo?.build(hotSportModel.componetOption!);
    List<Widget> subWidgets = [];
    hotSportModel?.components?.forEach((subHotSportModel) {
      Widget? sub = response != null
          ? subHotSportModel.drawRect(
              parentSize: Size(hotSportModel.componetOption!.size!.width,
                  hotSportModel.componetOption!.size!.height))
          : subHotSportModel.widgetInfo != null
              ? Positioned(
                  top: subHotSportModel.componetOption!.position!.y,
                  left: subHotSportModel.componetOption!.position!.x,
                  child: subHotSportModel.widgetInfo!
                      .build(subHotSportModel.componetOption!))
              : null;

      //Widget? sub = element.drawRect(parentSize: Size(hotSportModel.componetOption!.size!.width, hotSportModel.componetOption!.size!.height));
      if (sub != null) {
        subWidgets.add(sub);
      }
    });
    return Stack(children: [
      widget!,
      hotSportModel?.components != null
          ? Stack(children: subWidgets)
          : Container()
    ]);
  }

  @override
  Widget? hookIDETargetWidget(componetType, HotSportRequest hotSprotRequest) {
    var gestureAdaptee = getIt<HotSportService>()
        .geTargetAdapter(variant: componetType, request: hotSprotRequest);
    if (gestureAdaptee == null) {
      return null;
    }
    return gestureAdaptee.data;
  }

  @override
  void registerCustomHotSportBuilders(Map<dynamic, HotSportBuilder> builders) {
    getIt<HotSportService>().registerCustomHotSportBuilders(builders);
  }

  @override
  void initGlobalThemeData(GlobalThemeData? data) {
    _globalThemeData = data;
  }

  @override
  GlobalThemeData? globalThemeData() => _globalThemeData;

  @override
  bool get isHotSportBuildersRegistered {
    if (getIt<HotSportService>().hotSportBuilder == null) {
      return false;
    }
    if (getIt<HotSportService>().hotSportBuilder!.isEmpty) {
      return false;
    }
    return true;
  }
}

final HotSportInterface hotSportInterface = HotSportImpl();
