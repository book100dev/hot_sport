import 'dart:convert';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// import 'package:extended_image/extended_image.dart';

// import 'package:get/get.dart';
// import 'package:get_it/get_it.dart';
// import 'package:hot_sport/adapter/json_model_adapter/hot_sport_adapter_manager.dart';
// import 'package:hot_sport/adapter/json_model_adapter/hot_sport_request.dart';
// import 'package:hot_sport/adapter/json_model_adapter/hot_sport_response.dart';
// import 'package:hot_sport/adapter/json_model_adapter/json_model_type_adapter.dart';
// import 'package:hot_sport/data/componet_type.dart';

// import 'package:hot_sport/hot_sport.dart';
// import 'package:hot_sport/hot_sport_model.dart';
// import 'package:hot_sport/widget_info.dart';

import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:hot_sport/adapter/json_model_adapter/json_model_type_adapter.dart';
import 'package:hot_sport/hot_sport.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // String get testJsonString =>
  //     "[{\"pageId\":\"0B310514BB\",\"hotsportId\":\"157026\",\"parentHotsportId\":\"\",\"widgetInfo\":{\"componentTag\":\"Text\",\"componentName\":\"text\",\"componentId\":\"231264\",\"content\":\"这是一个文本\",\"food\":{\"foodName\":\"Food\",\"foodOnlineCategoryName\":\"\",\"foodID\":0,\"foodKey\":\"\",\"unitKey\":\"\",\"foodOnlineCategoryKey\":\"\",\"foodOnlineCategoryID\":\"\",\"price\":\"价格\",\"vipPrice\":\"vip 价格\",\"material_3DUrl\":\"\",\"imgePath\":\"\",\"material_2DUrl\":\"\",\"unit\":\"规格\",\"foodMnemonicCode\":\"\",\"foodCode\":\"\"}},\"componetOption\":{\"size\":{\"width\":120,\"height\":50},\"textStyle\":{\"fontSize\":14,\"hexColor\":\"292a24\",\"fontWeight\":\"正常\",\"align\":\"center\"},\"position\":{\"x\":746,\"y\":157},\"background\":{\"imageUrl\":\"\",\"hexColor\":\"ffffff\"},\"boxDecoration\":{\"hexBorderColor\":\"3c3c3c\",\"borderRadius\":0,\"lineWidth\":1,\"lineType\":0}},\"components\":[]},{\"pageId\":\"0B310514BB\",\"hotsportId\":\"836046\",\"parentHotsportId\":\"\",\"widgetInfo\":{\"componentTag\":\"Button\",\"componentName\":\"button\",\"componentId\":\"535158\",\"content\":\"这是一个按钮\",\"food\":{\"foodName\":\"Food\",\"foodOnlineCategoryName\":\"\",\"foodID\":0,\"foodKey\":\"\",\"unitKey\":\"\",\"foodOnlineCategoryKey\":\"\",\"foodOnlineCategoryID\":\"\",\"price\":\"价格\",\"vipPrice\":\"vip 价格\",\"material_3DUrl\":\"\",\"imgePath\":\"\",\"material_2DUrl\":\"\",\"unit\":\"规格\",\"foodMnemonicCode\":\"\",\"foodCode\":\"\"}},\"componetOption\":{\"size\":{\"width\":120,\"height\":50},\"textStyle\":{\"fontSize\":14,\"hexColor\":\"292a24\",\"fontWeight\":\"正常\",\"align\":\"center\"},\"position\":{\"x\":746,\"y\":318},\"background\":{\"imageUrl\":\"\",\"hexColor\":\"ffffff\"},\"boxDecoration\":{\"hexBorderColor\":\"3c3c3c\",\"borderRadius\":0,\"lineWidth\":1,\"lineType\":0}},\"components\":[]}]";

  String get testJsonString =>
      "{\"pageId\":\"0000\",\"hotsportId\":\"198207\",\"parentHotsportId\":\"\",\"widgetInfo\":{\"componentTag\":\"Div\",\"componentName\":\"div\",\"componentId\":\"597718\",\"content\":\"\",\"food\":{\"foodName\":\"Food\",\"foodOnlineCategoryName\":\"\",\"foodID\":0,\"foodKey\":\"\",\"unitKey\":\"\",\"foodOnlineCategoryKey\":\"\",\"foodOnlineCategoryID\":\"\",\"price\":\"价格\",\"vipPrice\":\"vip 价格\",\"material_3DUrl\":\"\",\"imgePath\":\"\",\"material_2DUrl\":\"\",\"unit\":\"规格\",\"foodMnemonicCode\":\"\",\"foodCode\":\"\"}},\"componetOption\":{\"size\":{\"width\":575.11474609375,\"height\":441.702880859375},\"textStyle\":{\"fontSize\":14,\"hexColor\":\"292a24\",\"fontWeight\":\"正常\",\"align\":\"center\"},\"position\":{\"x\":527.8486938476562,\"y\":93.21923828125},\"background\":{\"imageUrl\":\"\",\"hexColor\":\"ffffff\"},\"boxDecoration\":{\"hexBorderColor\":\"3c3c3c\",\"borderRadius\":0,\"lineWidth\":1,\"lineType\":0}},\"components\":[{\"pageId\":\"0000\",\"hotsportId\":\"602848\",\"parentHotsportId\":\"198207\",\"widgetInfo\":{\"componentTag\":\"Image\",\"componentName\":\"foodImage\",\"componentId\":\"\",\"content\":\"https://img3.chouti.com/CHOUTI_20230324/91CA45D79098434F98334AA9A0B9FA50_W364H364.jpeg\",\"food\":{\"foodName\":\"Food\",\"foodOnlineCategoryName\":\"\",\"foodID\":0,\"foodKey\":\"\",\"unitKey\":\"\",\"foodOnlineCategoryKey\":\"\",\"foodOnlineCategoryID\":\"\",\"price\":\"价格\",\"vipPrice\":\"vip 价格\",\"material_3DUrl\":\"\",\"imgePath\":\"\",\"material_2DUrl\":\"\",\"unit\":\"规格\",\"foodMnemonicCode\":\"\",\"foodCode\":\"\"}},\"componetOption\":{\"size\":{\"width\":525.6995849609375,\"height\":401.10760498046875},\"textStyle\":{\"fontSize\":14,\"hexColor\":\"292a24\",\"fontWeight\":\"正常\",\"align\":\"center\"},\"position\":{\"x\":20.53228759765625,\"y\":25.06280517578125},\"background\":{\"imageUrl\":\"\",\"hexColor\":\"ffffff\"},\"boxDecoration\":{\"hexBorderColor\":\"3c3c3c\",\"borderRadius\":0,\"lineWidth\":1,\"lineType\":0}},\"components\":[]}]}";

  List<Widget> list = [];

  @override
  void initState() {
    super.initState();

    // final builders = {
    //   ComponetType.foodImage: (context, hotSportRequest, completer) =>
    //       IDEHotSportImage(request: hotSportRequest, completer: completer),
    //   1000: (context, hotSportRequest, completer) => IDEHotSportGestureDetector(
    //       request: hotSportRequest, completer: completer),
    // };

    // final builders = {
    //   1000: GestureAdapter(), //赋予拖动、改变大小、选中、等能力
    //   ComponetType.foodImage: IDEBoxAdapter(), //赋予接受child的能力
    //   ComponetType.image: IDEBoxAdapter(), //赋予接受child的能力
    //   ComponetType.div: IDEBoxAdapter(), //赋予接受child的能力
    // };

    final builders = {
      // 1000: GestureAdapter(), //赋予拖动、改变大小、选中、等能力
      ComponetType.foodImage: (completer) =>
          IDEBoxAdapter(completer: completer), //赋予接受child的能力
      ComponetType.image: (completer) => IDEBoxAdapter(completer: completer),
      ComponetType.div: (completer) => IDEBoxAdapter(completer: completer)
//赋予接受child的能力
    };

    hotSportInterface.registerCustomHotSportBuilders(builders);

    var hotDatas = jsonDecode(testJsonString);
    list.add(HotSportModel.fromJson(hotDatas).drawRect());
    // List<HotSportModel> hotSports = hotDatas.map((e) {
    //   return HotSportModel.fromJson(e);
    // }).toList();
    // list = hotSports.map((e) {
    //   return e.drawRect();
    // }).toList();
    print('ss');
    GetIt.I.registerSingleton<HotSportTargetController>(
        HotSportTargetController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    color: Colors.white,
                    child: Draggable(
                      onDragStarted: () {
                        print('开始');
                      },
                      onDragEnd: (_) {
                        print('结束');
                      },
                      onDragCompleted: () {
                        print('已经接受了');
                      },
                      onDraggableCanceled: (_, Offset p) {
                        print('取消');
                      },
                      data: WidgetInfo(
                          componentTag: 'Text',
                          componentName: 'text',
                          componentId: '',
                          content: ''),
                      feedback: Container(
                          key: GlobalKey(),
                          child: Container(
                              width: 100, height: 30, color: Colors.pink)),
                      child: const AbsorbPointer(
                        absorbing: true,
                        child: Text('测试'),
                      ),
                    ))),
            Expanded(
                flex: 3,
                child: GestureDetector(
                  onTap: () {
                    HotSportTargetController controller =
                        GetIt.I.get<HotSportTargetController>();
                    controller.resetEditState();
                    print('恢复默认不选中');
                  },
                  // oontap: (PointerDownEvent event) {
                  //   //恢复默认不选中
                  //   print('恢复默认不选中');
                  //   // HotSportTargetController controller =
                  //   //     GetIt.I.get<HotSportTargetController>();
                  //   // controller.resetEditState();
                  // },
                  child: Container(
                    color: Colors.orange,
                    child: Stack(
                      children: list,
                    ),
                  ),
                ))
          ],
        ));
  }
}

class JsonModel<T> extends JsonModelTypeAdapter {
  Food? food;

  @override
  fromJson(Map<String, dynamic> json) {
    food = Food.fromJson(json);
    return food;
  }

  @override
  Map<String, dynamic>? toJson(dynamic data) {
    if (data is Food) return data.toJson();
    return null;
  }

  @override
  Type get type => Food;

  @override
  String content({required food, required ComponetType componetType}) {
    String? content;
    switch (componetType) {
      case ComponetType.foodName:
        content = food?.foodName;
        content ?? '菜品名称';
        break;
      default:
    }
    return content ?? '';
  }

  // @override
  // String content({required ComponetType componetType}) {
  // String? content;
  // switch (componetType) {
  //   case ComponetType.foodName:
  //     content = food?.foodName;
  //     break;
  //   default:
  // }
  // return content ?? '';
  // }
}

T? asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}

class Food {
  const Food({
    required this.foodName,
    this.foodOnlineCategoryName,
    this.foodID,
    this.foodKey,
    this.unitKey,
    this.foodOnlineCategoryKey,
    this.foodOnlineCategoryID,
    this.price,
    this.vipPrice,
    this.material3durl,
    this.imgePath,
    this.material2durl,
    this.unit,
    this.foodMnemonicCode,
    this.foodCode,
  });

  static const Food empty = Food(
      foodName: 'Food',
      foodOnlineCategoryName: '',
      foodID: 000,
      foodKey: '',
      unit: '规格',
      unitKey: '',
      foodOnlineCategoryID: '',
      foodOnlineCategoryKey: '',
      price: '价格',
      vipPrice: 'vip 价格',
      material2durl: '',
      material3durl: '',
      foodMnemonicCode: '',
      foodCode: '',
      imgePath: '');

  String get imageUrl {
    String url = 'https://res.hualala.com/' + imgePath!;
    return url;
  }

  factory Food.fromJson(Map<String, dynamic> jsonRes) => Food(
      foodName: asT<String>(jsonRes['foodName']) ?? '',
      foodOnlineCategoryName:
          asT<String>(jsonRes['foodOnlineCategoryName']) ?? '',
      foodID: asT<int>(jsonRes['foodID']) ?? 000,
      foodKey: asT<String>(jsonRes['foodKey']) ?? '',
      unitKey: asT<String>(jsonRes['unitKey']) ?? '',
      foodOnlineCategoryKey:
          asT<String>(jsonRes['foodOnlineCategoryKey']) ?? '',
      foodOnlineCategoryID: asT<String>(jsonRes['foodOnlineCategoryID']) ?? '',
      price: asT<String>(jsonRes['price'].toString()) ?? '',
      vipPrice: asT<String>(jsonRes['vipPrice'].toString()) ?? '',
      material3durl: asT<String>(jsonRes['material_3DUrl']) ?? '',
      imgePath: asT<String>(jsonRes['imgePath']) ?? '',
      material2durl: asT<String>(jsonRes['material_2DUrl']) ?? '',
      unit: asT<String>(jsonRes['unit']) ?? '',
      foodCode: asT<String>(jsonRes['foodCode']) ?? '',
      foodMnemonicCode: '');

  final String foodName;
  final String? foodOnlineCategoryName;
  final int? foodID;
  final String? foodKey;
  final String? unitKey;
  final String? foodOnlineCategoryKey;
  final String? foodOnlineCategoryID;
  final String? price;
  final String? vipPrice;
  final String? material3durl;
  final String? imgePath;
  final String? material2durl;
  final String? unit;
  final String? foodMnemonicCode;
  final String? foodCode;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'foodName': foodName,
        'foodOnlineCategoryName': foodOnlineCategoryName,
        'foodID': foodID,
        'foodKey': foodKey,
        'unitKey': unitKey,
        'foodOnlineCategoryKey': foodOnlineCategoryKey,
        'foodOnlineCategoryID': foodOnlineCategoryID,
        'price': price,
        'vipPrice': vipPrice,
        'material_3DUrl': material3durl,
        'imgePath': imgePath,
        'material_2DUrl': material2durl,
        'unit': unit,
        'foodMnemonicCode': foodMnemonicCode,
        'foodCode': foodCode,
      };
}

class IDEHotSportBox extends StatelessWidget {
  final HotSportRequest? request;
  final Function(HotSportResponse)? completer;
  const IDEHotSportBox({Key? key, required this.request, this.completer})
      : super(key: key);

  Widget get child => ExtendedImage.network(
        '',
        fit: BoxFit.fill,
        cache: true,
        border: Border.all(color: Colors.white, width: 1.0),
        shape: BoxShape.rectangle,
      );

  @override
  Widget build(BuildContext context) {
    return DragTarget<WidgetInfo>(
      onWillAccept: (var hotSportObject) {
        if (kDebugMode) {
          print('div 收到事件传递');
        }
        return true;
      },
      onAccept: (data) {
        var widgetInfojson = data.toJson();
        WidgetInfo widgetInfo = WidgetInfo.fromJson(widgetInfojson);
        if (completer != null) {
          completer!(HotSportResponse(confirmed: true, data: widgetInfo));
        }
      },
      builder: (BuildContext context, List<WidgetInfo?> candidateData,
          List<dynamic> rejectedData) {
        HotSportModel hotSportModel = request?.data;
        //hotSportModel.widgetInfo?.build(hotSportModel.widgetInfo!.option!);
        return Stack(
          children: [
            Positioned.fill(
                child: hotSportModel.widgetInfo
                        ?.build(hotSportModel.componetOption!) ??
                    const Text('可接受事件'))
          ],
        );
      },
    );
  }
}

class GestureAdapter extends ObjectAdapter {
  @override
  HotSportResponse response() {
    return HotSportResponse(data: IDEHotSportGestureDetector(request: request));
  }
}

class IDEBoxAdapter extends ObjectAdapter {
  IDEBoxAdapter({this.completer});
  Function(HotSportResponse)? completer;

  @override
  HotSportResponse response() {
    return HotSportResponse(
        data: IDEHotSportBox(request: request, completer: completer));
  }
}

class HotSportTargetController extends GetxController {
  List<HotSportModel?> _hotsports = [];

  void setDataSource(List<HotSportModel> hotSports) {
    _hotsports = hotSports;
  }

  bool _seleted = false;

  bool get isSeleted => _seleted;

  set selected(bool selected) {
    _seleted = selected;
    update();
  }

  bool _divShowMenu = false;
  bool get divMenuShow => _divShowMenu;
  set showDivMenu(bool selected) {
    _divShowMenu = selected;
    update();
  }

  void resetEditState() {
    showDivMenu = false;
  }
}

class IDEHotSportGestureDetector extends StatelessWidget {
  final HotSportRequest? request;
  final Function(HotSportResponse)? completer;
  const IDEHotSportGestureDetector(
      {Key? key, required this.request, this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    HotSportModel hotSportModel = request?.data as HotSportModel;
    return GetBuilder<HotSportTargetController>(
        init: GetIt.I.get<HotSportTargetController>(),
        builder: (controller) {
          Widget? targetWidget = hotSportInterface.hookIDETargetWidget(
              hotSportModel.widgetInfo?.componetType, request!);
          return badges.Badge(
            badgeAnimation: badges.BadgeAnimation.scale(),
            badgeStyle: badges.BadgeStyle(badgeColor: Colors.white),
            showBadge: controller.divMenuShow,
            position: badges.BadgePosition.topEnd(top: 0, end: 0),
            badgeContent: GestureDetector(
              onTap: () {
                print('jjjjjjjj');
              },
              child: PopupMenuButton<String>(
                tooltip: '',
                child: Icon(Icons.more_horiz),
                //splashRadius:1,
                itemBuilder: (context) => ['锁定', '保存为组件']
                    .toList()
                    .map((e) => PopupMenuItem<String>(value: e, child: Text(e)))
                    .toList(),
                offset: Offset(0, 30),
                color: Color(0xffF4FFFA),
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                onSelected: (e) {},
                onCanceled: () => print('onCanceled'),
              ),
            ),
            child: Container(
              color: Colors.red,
              child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onPanUpdate: (details) {
                    //...
                    print('拖动控件');
                    hotSportModel.componetOption?.position!.x +=
                        details.delta.dx;
                    hotSportModel.componetOption?.position!.y +=
                        details.delta.dy;
                    request?.viewModel?.notifyListeners();
                  },
                  onTap: () {
                    if (hotSportModel.widgetInfo!.componetType ==
                        ComponetType.div) {
                      controller.showDivMenu = true;
                    }
                    controller.selected = true;

                    //...
                    print('点击事件');
                  },
                  child: Container(
                      color: Colors.blue,
                      child: Stack(children: [
                        Container(
                          child: targetWidget,
                        ),
                        controller.isSeleted
                            ? Positioned(
                                bottom: 0,
                                right: 0,
                                child: GestureDetector(
                                    onPanUpdate: (details) {
                                      hotSportModel.componetOption?.size!
                                          .width += details.delta.dx;
                                      hotSportModel.componetOption?.size!
                                          .height += details.delta.dy;
                                      request?.viewModel?.notifyListeners();
                                    },
                                    child: Container(
                                      width: 10,
                                      height: 10,
                                      color: Colors.red,
                                    )),
                              )
                            : Container(),
                      ]))),
            ),
          );
        });
  }
}
