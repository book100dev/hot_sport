// import 'package:flutter/material.dart';
// import 'package:hot_sport/base/hot_sport_widget.dart';
// import 'package:hot_sport/data/componet_type.dart';

part of hot_sport;

class HotSportWriteText extends HotSportWidget {
  final String content;
  const HotSportWriteText(
      {super.key, super.componetOption, required this.content});

  @override
  double get defaultWidth => ComponetType.text.size.width;

  @override
  double get defaultHight => ComponetType.text.size.height;

  @override
  Widget get snapshot => const Center(
      child: Text(
        '跑马文本',
        style: SnapshotExt.snapshotTextStyle,
      ));
  @override
  Widget? get faceback => Image.asset("packages/hot_sport/assets/images/writeText.png");
  @override
  Widget child() => WriteText(
        data: content,
        textStyle: TextStyle(
            decoration: TextDecoration.none,
            color: textColor(componetOption),
            fontSize: componetOption != null
                ? componetOption?.textStyle?.fontSize
                : defaultTextFontSize,
            package: 'hot_sport',
            fontFamily: componetOption?.textStyle?.fontFamily,
            fontWeight: fontWeight(componetOption)),
      );
}

///
/// 字符间隔默认时长
///
const int _kDefaultMillSeconds = 300;

///
/// 默认光标
///
const Widget _kDefaultCursor = _DefaultCursor();

///
/// desc: WriteText 是逐步显示文本的动画组件，像手写一样的效果。
///
class WriteText extends StatefulWidget {
  ///
  /// 数据
  ///
  final String data;

  ///
  /// 是否显示光标
  ///
  final bool showCursor;

  ///
  /// 光标组件
  ///
  final Widget? cursor;

  ///
  /// 字符间隔时长
  ///
  final int perMillSeconds;

  ///
  /// 激活状态文本的样式
  ///
  final TextStyle? textStyle;

  ///
  /// 是否自动启动
  ///
  final bool autoStart;

  ///
  /// 控制器
  ///
  final WriteTextController? controller;

  const WriteText({
    Key? key,
    required this.data,
    this.controller,
    this.showCursor = true,
    this.cursor = _kDefaultCursor,
    this.perMillSeconds = _kDefaultMillSeconds,
    this.textStyle,
    this.autoStart = true,
  }) : super(key: key);

  @override
  WriteTextState createState() => WriteTextState();
}

class WriteTextState extends State<WriteText>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        duration:
            Duration(milliseconds: widget.perMillSeconds * widget.data.length));
    if (widget.autoStart) {
      _animationController.forward();
    }
    if (widget.controller != null) {
      widget.controller?._setStepTextState(this);
    }
    super.initState();
  }

  ///
  /// 启动
  ///
  start() {
    _animationController.forward();
  }

  ///
  /// 停止
  ///
  stop() {
    _animationController.stop();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        int endIndex =
            (widget.data.length * _animationController.value).floor();
        var text = widget.data.substring(0, endIndex);
        return RichText(
          text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <InlineSpan>[
                TextSpan(
                    text: '$text ', style: widget.textStyle ?? TextStyle()),
                if (widget.showCursor)
                  WidgetSpan(
                      child: StepTextCursor(
                    cursor: widget.cursor ?? _kDefaultCursor,
                  )),
              ]),
        );
      },
    );
  }
}

class StepTextCursor extends StatefulWidget {
  final Widget cursor;

  const StepTextCursor({Key? key, required this.cursor}) : super(key: key);

  @override
  StepTextCursorState createState() => StepTextCursorState();
}

class StepTextCursorState extends State<StepTextCursor>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _controller.reverse();
            } else if (status == AnimationStatus.dismissed) {
              _controller.forward();
            }
          });
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget? child) {
          return Opacity(
            opacity: _controller.value,
            child: widget.cursor,
          );
        });
  }
}

class _DefaultCursor extends StatelessWidget {
  const _DefaultCursor();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 1,
      color: Theme.of(context).primaryColor,
    );
  }
}

class WriteTextController {
  WriteTextState? stepTextState;
  void _setStepTextState(WriteTextState? stepTextState) {
    this.stepTextState = stepTextState;
  }

  start() {
    stepTextState?.start();
  }

  stop() {
    stepTextState?.stop();
  }
}
