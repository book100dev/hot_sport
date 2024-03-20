// import 'package:flutter/material.dart';
// import 'package:stacked/stacked.dart';

// import 'adapter/json_model_adapter/hot_sport_request.dart';
// import 'base/componet_option.dart';
// import 'hot_sport.dart';
// import 'widget_info.dart';

part of hot_sport;

class HotSportModel {
  HotSportModel({
    this.pageId,
    required this.hotsportId,
    required this.parentHotsportId,
    this.widgetInfo,
    this.components,
    this.componetOption,
  }) : assert(widgetInfo != null, 'widgetInfo -> 不能为空') {
    componetOption = ComponetOption.empty(data: widgetInfo!);
  }

  String? pageId;

  String hotsportId;

  String parentHotsportId;

  WidgetInfo? widgetInfo;

  ComponetOption? componetOption;

  List<HotSportModel>? components;

  HotSportModel.fromJson(Map<String, dynamic> json, {String? foodCategoryName})
      : pageId = json['pageId'],
        hotsportId = json['hotsportId'],
        parentHotsportId = json['parentHotsportId'],
        widgetInfo = json['widgetInfo'] != null
            ? WidgetInfo.fromJson(json['widgetInfo'],
                foodCategoryName: foodCategoryName)
            : null,
        componetOption = json['componetOption'] != null
            ? ComponetOption.fromJson(json['componetOption'])
            : null,
        components = json['components'] == null
            ? []
            : List.from(json['components']).map((e) {
                return HotSportModel.fromJson(e);
              }).toList();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (pageId != null) {
      data['pageId'] = pageId;
    }
    if (hotsportId != null) {
      data['hotsportId'] = hotsportId;
    }
    if (parentHotsportId != null) {
      data['parentHotsportId'] = parentHotsportId;
    }

    if (widgetInfo != null) {
      data['widgetInfo'] = widgetInfo?.toJson();
    }
    if (componetOption != null) {
      data['componetOption'] = componetOption?.toJson();
    }
    if (components != null) {
      data['components'] = components?.map((v) => v.toJson()).toList();
    }

    return data;
  }

  HotSportViewModel? _model;
  void update() => _model?.notifyListeners();

  Widget screenshot() {
    double top = componetOption?.position!.y ?? 0;
    double left = componetOption?.position!.x ?? 0;
    double width = componetOption?.size!.width ?? 0;
    double height = componetOption?.size!.height ?? 0;
    return Positioned(
        top: top,
        left: left,
        width: width,
        height: height,
        child: Container(
          child: hotSportInterface.screenshot(this),
        ));
  }

  Widget drawRect({Size? parentSize, bool move = true}) {
    // double top = componetOption?.position!.y ?? 0;
    // double left = componetOption?.position!.x ?? 0;
    // double width = componetOption?.size!.width ?? 0;
    // double height = componetOption?.size!.height ?? 0;
    // return Positioned(
    //     top: top,
    //     left: left,
    //     width: width,
    //     height: height,
    //     child: Builder(builder: (context) {
    //       print('看看再次执行了没有');
    //       return Container(
    //         child: hotSportInterface.hotSportLayoutBuilder(
    //             widgetInfo?.componetType,
    //             context,
    //             HotSportRequest(
    //                 hotSportId: parentHotsportId,
    //                 content: widgetInfo?.content,
    //                 move: false,
    //                 data: this)),
    //       );
    //     }));
    return ViewModelBuilder<HotSportViewModel>.reactive(
        viewModelBuilder: () => HotSportViewModel(),
        fireOnViewModelReadyOnce: true,
        builder: (context, viewModel, _) {
          print('hot_sport_model_执行了....');
          _model = viewModel;
          double top = componetOption?.position!.y ?? 0;
          double left = componetOption?.position!.x ?? 0;
          double width = componetOption?.size!.width ?? 0;
          double height = componetOption?.size!.height ?? 0;
          if (top < 0) {
            top = 0;
            componetOption?.position!.y = top;
          }
          if (width <= 16) {
            width = 16;
            componetOption?.size!.width = width;
          }
          if (height <= 16) {
            height = 16;
            componetOption?.size!.height = height;
          }
          if (left < 0) {
            left = 0;
            componetOption?.position!.x = 0;
          }
          if (parentSize != null) {
            if ((top + height) > parentSize.height) {
              top = parentSize.height - height;
              if (top < 0) top = 0;
              componetOption?.position!.y = top;
            }
            if ((left + width) > parentSize.width) {
              left =
                  parentSize.width - width < 0 ? 0 : parentSize.width - width;
              componetOption?.position!.x = left;
            }
            if (width > parentSize.width) {
              componetOption?.size!.width = parentSize.width;
              width = parentSize.width - left;
            }
            if (height > parentSize.height) {
              componetOption?.size!.height = parentSize.height;
              height = parentSize.height - top;
            }
          }
          return Positioned(
              top: top,
              left: left,
              width: width,
              height: height,
              child: Container(
                child: hotSportInterface.hotSportLayoutBuilder(
                    widgetInfo?.componetType,
                    context,
                    HotSportRequest(
                        hotSportId: parentHotsportId,
                        content: widgetInfo?.content,
                        move: move,
                        data: this,
                        viewModel: viewModel)),
              ));
        });
  }
}

class HotSportViewModel extends BaseViewModel {}
