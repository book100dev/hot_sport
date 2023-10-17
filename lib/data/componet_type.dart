// import 'package:flutter/material.dart';

part of hot_sport;

enum ComponetType {
  text('text', 'Text','普通文本'),
  foodName('foodName', 'Text','菜品名称'),
  foodUnit('foodUnit', 'Text','菜品规格'),
  foodPrice('foodPrice', 'Text','菜品价格'),
  foodVipPrice('foodVipPrice', 'Text','会员价格'),
  writeText('writeText', 'Text','跑马文本'),
  button('button', 'Button','按钮'),
  imageButton('imageButton', 'Button','图片按钮'),
  image('image', 'Image','普通图片'),
  foodImage('foodImage', 'Image','菜品图片'),
  bgImage('bgImage', 'Image','背景图片'),
  video('video', 'Video','视频'),
  animation('animation', 'Animation','动画'),
  food1('food1', 'Food','样式1'),
  food2('food2', 'Food','样式2'),
  food3('food3', 'Food','样式3'),
  food4('food4', 'Food','样式4'),
  food5('food5', 'Food','样式5'),
  table('table', 'Table','列表'),
  navBar('navbar', 'NavBar','导航'),
  search('search', 'Search','搜索'),
  shopCart('shopCart', 'ShopCart','合计1'),
  shopCartRounded('shopCartRounded', 'ShopCart','合计2'),
  shopCartIconButton('shopCartIconButton', 'ShopCart','购物车'),
  div('div', 'Box','容器');

  static bool isFood(String string) {
    ComponetType type =
        ComponetType.values.firstWhere((element) => element.value == string);
    return type.sectionTag == 'Food';
  }

  static bool isImage(String string) {
    ComponetType type =
        ComponetType.values.firstWhere((element) => element.value == string);
    return type.sectionTag == 'Image';
  }

  static bool isText(String string) {
    ComponetType type =
        ComponetType.values.firstWhere((element) => element.value == string);
    return type.sectionTag == 'Text';
  }

  static bool isButton(String string) {
    ComponetType type =
        ComponetType.values.firstWhere((element) => element.value == string);
    return type.sectionTag == 'Button';
  }

  final String value;
  final String sectionTag;
  final String des;
  const ComponetType(this.value, this.sectionTag, this.des);
}

extension ComponetTag on ComponetType {
  bool isFood(String string) {
    return true;
  }

  String get defaultContent {
    if (value == 'text') {
      return '普通文本';
    }
    if (value == 'writeText') {
      return '跑马文本';
    }
    if (value == 'foodName') {
      return '菜品名称';
    }
    if (value == 'foodUnit') {
      return '菜品规格';
    }
    if (value == 'foodPrice') {
      return '常规价格';
    }
    if (value == 'foodVipPrice') {
      return '会员价格';
    }
    if (value == 'button') {
      return '按钮';
    }
    if (value == 'search') {
      return '搜索';
    }
    if (value == 'shopCartIconButton') {
      return '已点菜品';
    }
    return '';
  }
}

extension ComponetDefuateSize on ComponetType {
  Size get size {
    if (this == ComponetType.text) {
      return const Size(100.0, 30.0);
    } else if (this == ComponetType.foodName) {
      return const Size(100.0, 30.0);
    } else if (this == ComponetType.foodUnit) {
      return const Size(50.0, 25.0);
    } else if (this == ComponetType.foodPrice) {
      return const Size(50.0, 25.0);
    } else if (this == ComponetType.foodVipPrice) {
      return const Size(50.0, 25.0);
    } else if (this == ComponetType.writeText) {
      return const Size(130.0, 30.0);
    } else if (this == ComponetType.button) {
      return const Size(116.0, 32.0);
    } else if (this == ComponetType.imageButton) {
      return const Size(35.0, 35.0);
    } else if (this == ComponetType.foodImage) {
      return const Size(150.0, 100.0);
    } else if (this == ComponetType.image) {
      return const Size(150.0, 100.0);
    } else if (this == ComponetType.bgImage) {
      return const Size(0.0, 0.0);
    } else if (this == ComponetType.video) {
      return const Size(150.0, 100.0);
    } else if (this == ComponetType.animation) {
      return const Size(150.0, 100.0);
    } else if (this == ComponetType.food1) {
      return const Size(300.0, 50.0);
    } else if (this == ComponetType.food2) {
      return const Size(300.0, 95.0);
    } else if (this == ComponetType.food3) {
      return const Size(110.0, 350.0);
    } else if (this == ComponetType.food4) {
      return const Size(260.0, 110.0);
    } else if (this == ComponetType.food5) {
      return const Size(320.0, 110.0);
    } else if (this == ComponetType.table) {
      return const Size(250.0, 110.0);
    } else if (this == ComponetType.navBar) {
      return const Size(200.0, 56.0);
    } else if (this == ComponetType.search) {
      return const Size(86.0, 28.0);
    } else if (this == ComponetType.shopCart) {
      return const Size(170.0, 40.0);
    } else if (this == ComponetType.shopCartRounded) {
      return const Size(185.0, 40.0);
    } else if (this == ComponetType.shopCartIconButton) {
      return const Size(90.0, 28.0);
    } else if (this == ComponetType.div) {
      return const Size(240.0, 158.0);
    }
    return const Size(82.0, 54.0);
  }
}
