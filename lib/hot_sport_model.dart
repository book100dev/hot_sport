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

  HotSportModel.fromJson(Map<String, dynamic> json)
      : pageId = json['pageId'],
        hotsportId = json['hotsportId'],
        parentHotsportId = json['parentHotsportId'],
        widgetInfo = json['widgetInfo'] != null
            ? WidgetInfo.fromJson(json['widgetInfo'])
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

  late HotSportViewModel _model;
  void update() => _model.notifyListeners();

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

  Widget drawRect({Size? parentSize}) {
    return ViewModelBuilder<HotSportViewModel>.reactive(
        viewModelBuilder: () => HotSportViewModel(),
        fireOnModelReadyOnce: true,
        builder: (context, viewModel, _) {
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
            if ((left + width) > parentSize.width ) {
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
              top: top, //componetOption?.position!.y,
              left: left, //componetOption?.position!.x,
              width: width, //componetOption?.size!.width,
              height: height, //componetOption?.size!.height,
              child: Container(
                child: hotSportInterface.hotSportLayoutBuilder(
                    widgetInfo?.componetType,
                    context,
                    HotSportRequest(
                        hotSportId: parentHotsportId,
                        content: widgetInfo?.content,
                        data: this,
                        viewModel: viewModel)),
              )
              /*
               FutureBuilder<Widget>(
                  future: hotSportInterface.hotSportLayoutBuilder(
                      context,
                      HotSportRequest(
                          hotSportId: parentHotsportId,
                          content: widgetInfo?.content,
                          data: this,
                          viewModel: viewModel
                          )),
                  builder:
                      (BuildContext context, AsyncSnapshot<Widget> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return snapshot.data ??
                          Stack(children: [
                            Container(
                              child: widgetInfo?.build(componetOption!),
                            ),
                            Stack(children: subWidgets),
                          ]);
                    }
                    return Container();
                  })*/

              /*
            GestureDetector(
                onPanUpdate: (details) {
                  //dragTarget
                  //1、移动位置 改变 componetOption 的 position 的 x 和 y
                  //2、属性面板值更新
                  //3、先中状态更新
                  bool divGroupLock = true;
                  HotSportModel? parentHotSportModel =
                      dragTarget?.findParent(this.parentHotsportId);
                  if (parentHotSportModel != null &&
                      parentHotSportModel.widgetInfo!.isDiv) {
                    divGroupLock = parentHotSportModel.divGroupLock;
                    divGroupLock = false;
                  }
                  dragTarget?.setMove = true;
                  if (divGroupLock && parentHotSportModel != null) {
                    parentHotSportModel.componetOption?.position!.x +=
                        details.delta.dx;
                    parentHotSportModel.componetOption?.position!.y +=
                        details.delta.dy;
                    parentHotSportModel.update();
                    if (dragTarget != null) {
                      dragTarget!.moveCallBack(parentHotSportModel);
                    }
                    return;
                  }
                  componetOption?.position!.x += details.delta.dx;
                  componetOption?.position!.y += details.delta.dy;
                  viewModel.notifyListeners();
                  if (dragTarget != null) {
                    dragTarget!.moveCallBack(this);
                  }
                },
                onTap: () {
                  seleted = true;
                  if (canSeleted == false) seleted = false;
                  if (dragTarget != null && _lastSeleted != isSeleted) {
                    dragTarget?.setMove = false;
                    dragTarget?.didSeleted(this);
                  }
                  _lastSeleted = true;
                  viewModel.notifyListeners();
                },
                child: Stack(
                  children: [
                    Container(
                      child: widgetInfo?.build(componetOption!),
                      decoration: (isSeleted && canSeleted)
                          ? BoxDecoration(
                              border: RDottedLineBorder.all(
                                width: 1,
                              ),
                            )
                          : BoxDecoration(),
                    ),
                    Stack(children: subWidgets),
                    (isSeleted && canSeleted)
                        ? Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                                onPanUpdate: (details) {
                                  dragTarget?.setMove = true;
                                  componetOption?.size!.width +=
                                      details.delta.dx;
                                  componetOption?.size!.height +=
                                      details.delta.dy;
                                  viewModel.notifyListeners();
                                  if (dragTarget != null) {
                                    dragTarget!.sizeChangeCallBack(this);
                                  }
                                },
                                child: Container(
                                  width: 10,
                                  height: 10,
                                  color: Colors.red,
                                )),
                          )
                        : Container(),
                    Offstage(
                      offstage: !acceptData,
                      child: !widgetInfo!.isDiv
                          ? Container()
                          : Container(
                              width: componetOption?.size?.width,
                              height: componetOption?.size?.height,
                              child: Stack(
                                children: [
                                  Container(
                                      child:
                                          widgetInfo?.build(componetOption!)),
                                  Center(child: Text('acceptData'))
                                ],
                              ),
                              color: Colors.amberAccent),
                    )
                  ],
                )),*/

              );
        });
  }
}

class HotSportViewModel extends BaseViewModel {}
