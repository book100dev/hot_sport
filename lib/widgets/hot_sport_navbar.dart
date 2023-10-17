part of hot_sport;

class HotSportNavBar extends HotSportWidget {
  final String content;
  final Function(String content)? callBack;
  const HotSportNavBar(
      {super.key,
      super.componetOption,
      super.customWidget,
      required this.content,
      this.callBack});

  @override
  double get defaultWidth => ComponetType.navBar.size.width;

  @override
  double get defaultHight => ComponetType.navBar.size.height;

  @override
  Widget get snapshot =>
      Image.asset("packages/hot_sport/assets/images/navbar_snapshot.png");

  @override
  Widget child() => const NavBarWidget();
}

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});
  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget>
    with TickerProviderStateMixin, HotSportWidgetTextMixin {
  late TabController _tabController;
  //late NavBarController navController;
  final navController = Get.find<HotSportNavBarController>();
  late List<Widget> _tabs;
  @override
  void dispose() {
    super.dispose();
    //navController.config = NavBarConfig();
    navController.removeListener(() {});
  }

  @override
  void initState() {
    super.initState();
    //HotSportNavBarController.bu
    if (navController.titles == null) {
      _tabs = [
        const Tab(
          text: '热菜',
        ),
        const Tab(
          text: '凉菜',
        ),
        const Tab(
          text: '推荐菜品',
        ),
        const Tab(
          text: '汤类',
        ),
        const Tab(
          text: '甜品',
        ),
        const Tab(
          text: '北京特色',
        ),
        const Tab(
          text: '蒙古特色羊肉',
        )
      ];
    } else {
      _tabs = navController.titles!
          .map((title) => Tab(
                text: title,
              ))
          .toList();
    }
    if (navController.tabController != null &&
        navController.tabController!.length == navController.titles!.length) {
      _tabController = navController.tabController!;
    } else {
      _tabController = TabController(length: _tabs.length, vsync: this);
    }
    navController.addListener(() {
      if (mounted) {
        setState(() {
          _tabs = navController.titles!
              .map((title) => Tab(
                    text: title,
                  ))
              .toList();
          _tabController = TabController(length: _tabs.length, vsync: this);
          navController.tabController = _tabController;
        });
      }
    });
    navController.tabController = _tabController;
    // _tabController.addListener(() {
    //   if (_tabController.index.toDouble() == _tabController.animation?.value) {
    //     print('是我想看到的~~');
    //     navController.index = _tabController.index;
    //   }
    // });

    // Future.delayed(Duration(milliseconds: 9000), () {
    //   print("延时1秒执行");
    //   _tabController.animateTo(2);

    //   Future.delayed(Duration(milliseconds: 9000), () {
    //     print("延时1秒执行");
    //     // _tabController.index = 3;
    //     _tabController.animateTo(3);
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return ButtonsTabBar(
      itemBackgroundImageUrl: navController.config.itemlBackgroundImage,
      itemBackgroundColor: navController.config.itemBackgroundColor == null
          ? null
          : HexColor.fromHex(navController.config.itemBackgroundColor!),
      itemUnselectedBackgroundImageUrl:
          navController.config.unselectedLabelBackgroundImage,
      itemUnselectedBackgroundColor:
          navController.config.unselectedLabelBackgroundColor == null
              ? null
              : HexColor.fromHex(
                  navController.config.unselectedLabelBackgroundColor!),
      separatorType: 2,
      runSpacing: navController.config.runSpacing!,
      buttonHeight: navController.config.itemHeight!,
      buttonWidth: navController.config.itemWidth!,
      contentMargin: navController.config.contentMargin!,
      radius: navController.config.radius!,
      itemRadius: navController.config.itemRadius!,
      labelStyle: TextStyle(
          decoration: TextDecoration.none,
          fontSize: navController.config.lableFontSize == null
              ? 13
              : navController.config.lableFontSize!.toDouble(),
          package: 'hot_sport',
          fontFamily: navController.config.fontFamily,
          fontWeight: fontWeight(navController.hotSportModel?.componetOption),
          color: navController.config.labelColor == null
              ? Colors.black
              : HexColor.fromHex(navController.config.labelColor!)),
      unselectedLabelStyle: TextStyle(
          decoration: TextDecoration.none,
          fontSize: navController.config.lableFontSize == null
              ? 13
              : navController.config.lableFontSize!.toDouble(),
          package: 'hot_sport',
          fontFamily: navController.config.fontFamily,
          fontWeight: fontWeight(navController.hotSportModel?.componetOption),
          color: navController.config.unselectedLabelColor == null
              ? Colors.black
              : HexColor.fromHex(navController.config.unselectedLabelColor!)),
      tabs: _tabs,
      controller: _tabController,
      onTap: (int tabIndex) {
        // print('当前点击的~ $tabIndex');
        navController.index = _tabController.index;
      },
    );
  }
}

const double _kTabHeight = 46.0;

class ButtonsTabBar extends StatefulWidget implements PreferredSizeWidget {
  ButtonsTabBar({
    Key? key,
    required this.tabs,
    this.controller,
    this.buttonWidth = 60,
    this.buttonHeight = 35,
    this.separatorType = 0,
    this.separatorColor,
    this.duration = 250,
    this.backgroundColor,
    this.backgroundImageUrl,
    this.itemBackgroundImageUrl,
    this.itemBackgroundColor,
    this.itemUnselectedBackgroundImageUrl,
    this.itemUnselectedBackgroundColor,
    this.decoration,
    this.unselectedDecoration,
    this.labelStyle,
    this.unselectedLabelStyle,
    this.splashColor,
    this.borderWidth = 0,
    this.borderColor = Colors.transparent,
    this.unselectedBorderColor = Colors.transparent,
    this.physics = const BouncingScrollPhysics(),
    this.contentMargin = 0,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 4),
    this.buttonMargin = const EdgeInsets.all(4),
    this.runSpacing = 6.0,
    this.labelSpacing = 4.0,
    this.radius = 1.0,
    this.itemRadius = 1.0,
    this.elevation = 0,
    this.height = _kTabHeight,
    this.center = false,
    this.onTap,
  }) : super(key: key) {
    assert(runSpacing > 0);
    assert(backgroundColor == null || decoration == null);
    assert(
        itemUnselectedBackgroundColor == null || unselectedDecoration == null);
  }

  final int separatorType;

  final Color? separatorColor;

  final double buttonWidth;

  //分类按钮的高度
  final double buttonHeight;

  /// Typically a list of two or more [Tab] widgets.
  ///
  /// The length of this list must match the [controller]'s [TabController.length]
  /// and the length of the [TabBarView.children] list.
  final List<Widget> tabs;

  /// This widget's selection and animation state.
  ///
  /// If [TabController] is not provided, then the value of [DefaultTabController.of]
  /// will be used.
  final TabController? controller;

  /// The duration in milliseconds of the transition animation.
  final int duration;

//背景颜色
  final Color? backgroundColor;
//背景图片
  final String? backgroundImageUrl;

  /// The background [Color] of the button on its selected state.
  ///
  /// If [Color] is not provided, [Theme.of(context).accentColor] is used.
  final Color? itemBackgroundColor;

  final String? itemBackgroundImageUrl;

  /// The background [Color] of the button on its unselected state.
  ///
  /// If [Color] is not provided, [Colors.grey[300]] is used.
  final Color? itemUnselectedBackgroundColor;

  final String? itemUnselectedBackgroundImageUrl;

  /// The splash [Color] of the button.
  ///
  /// If [Color] is not provided, the default is used.
  final Color? splashColor;

  /// The [BoxDecoration] of the button on its selected state.
  ///
  /// If [BoxDecoration] is not provided, [backgroundColor] is used.
  final BoxDecoration? decoration;

  /// The [BoxDecoration] of the button on its unselected state.
  ///
  /// If [BoxDecoration] is not provided, [unselectedBackgroundColor] is used.
  final BoxDecoration? unselectedDecoration;

  /// The [TextStyle] of the button's [Text] on its selected state. The color provided
  /// on the TextStyle will be used for the [Icon]'s color.
  ///
  /// The default value is: [TextStyle(color: Colors.white)].
  final TextStyle? labelStyle;

  /// The [TextStyle] of the button's [Text] on its unselected state. The color provided
  /// on the TextStyle will be used for the [Icon]'s color.
  ///
  /// The default value is: [TextStyle(color: Colors.black)].
  final TextStyle? unselectedLabelStyle;

  /// The with of solid [Border] for each button. If no value is provided, the border
  /// is not drawn.
  ///
  /// The default value is: 0.
  final double borderWidth;

  /// The [Color] of solid [Border] for each button.
  ///
  /// The default value is: [Colors.black].
  final Color? borderColor;

  /// The [Color] of solid [Border] for each button. If no value is provided, the value of
  /// [this.borderColor] is used.
  ///
  /// The default value is: [Colors.black].
  final Color? unselectedBorderColor;

  /// The physics used for the [ScrollController] of the tabs list.
  ///
  /// The default value is [BouncingScrollPhysics].
  final ScrollPhysics physics;

  /// The [EdgeInsets] used for the [Padding] of the buttons' content.
  ///
  /// The default value is [EdgeInsets.symmetric(horizontal: 4)].
  final EdgeInsets contentPadding;

  //如果是横向显示 即为 左右边距，如果是纵向显示 即为 上下边距
  final double contentMargin;

  /// The [EdgeInsets] used for the [Margin] of the buttons.
  ///
  /// The default value is [EdgeInsets.all(4)].
  final EdgeInsets buttonMargin;

  /// The spacing between the [Icon] and the [Text]. If only one of those is provided,
  /// no spacing is applied.
  final double labelSpacing;

  //分类按钮直接的间距 ps: 必须大于0
  final double runSpacing;

  /// The value of the [BorderRadius.circular] applied to each button.
  final double radius;

  final double itemRadius;

  /// The value of the [elevation] applied to each button.
  final double elevation;

  /// Override the default height.
  ///
  /// If no value is provided, the material height, 46.0, is used. If height is [null],
  /// the height is computed by summing the material height, 46, and the vertical values
  /// for [contentPadding] and [buttonMargin].
  final double? height;

  /// Center the tab buttons
  final bool center;

  /// An optional callback that's called when the [TabBar] is tapped.
  ///
  /// The callback is applied to the index of the tab where the tap occurred.
  ///
  /// This callback has no effect on the default handling of taps. It's for
  /// applications that want to do a little extra work when a tab is tapped,
  /// even if the tap doesn't change the [TabController]'s index. [TabBar] onTap
  /// callbacks should not make changes to the [TabController] since that would
  /// interfere with the default tap handler.
  final void Function(int)? onTap;

  @override
  Size get preferredSize {
    return Size.fromHeight(height ??
        (_kTabHeight + contentPadding.vertical + buttonMargin.vertical));
  }

  @override
  _ButtonsTabBarState createState() => _ButtonsTabBarState();
}

class _ButtonsTabBarState extends State<ButtonsTabBar>
    with TickerProviderStateMixin {
  TabController? _controller;

  final ScrollController _scrollController = ScrollController();

  late AnimationController _animationController;

  late List<GlobalKey> _tabKeys;
  final GlobalKey _tabsContainerKey = GlobalKey();
  final GlobalKey _tabsParentKey = GlobalKey();

  int _currentIndex = 0;
  // int _prevIndex = -1;
  int _aniIndex = 0;
  double _prevAniValue = 0;

  // check the direction of the text LTR or RTL
  late bool _textLTR;

  EdgeInsets _centerPadding = EdgeInsets.zero;

  Decoration? indicator;

  final navController = Get.find<HotSportNavBarController>();

  @override
  void initState() {
    super.initState();
    Get.put(HotSportTabBarBadgeController());
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _getCenterPadding(context));
    _tabKeys = widget.tabs.map((Widget tab) => GlobalKey()).toList();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.duration));
    _animationController.value = 1.0;
    _animationController.addListener(() {
      setState(() {});
    });
  }

  void _updateTabController() {
    final TabController newController =
        widget.controller ?? DefaultTabController.of(context);
    assert(() {
      if (newController == null) {
        throw FlutterError('No TabController for ${widget.runtimeType}.\n'
            'When creating a ${widget.runtimeType}, you must either provide an explicit '
            'TabController using the "controller" property, or you must ensure that there '
            'is a DefaultTabController above the ${widget.runtimeType}.\n'
            'In this case, there was neither an explicit controller nor a default controller.');
      }
      return true;
    }());

    if (newController == _controller) return;

    if (_controllerIsValid) {
      _controller?.animation!.removeListener(_handleTabAnimation);
      _controller?.removeListener(_handleController);
    }
    _controller = newController;
    _controller?.animation!.addListener(_handleTabAnimation);
    _controller?.addListener(_handleController);
    _currentIndex = _controller!.index;
  }

  // If the TabBar is rebuilt with a new tab controller, the caller should
  // dispose the old one. In that case the old controller's animation will be
  // null and should not be accessed.
  bool get _controllerIsValid => _controller?.animation != null;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    assert(debugCheckHasMaterial(context));
    _updateTabController();
  }

  @override
  void didUpdateWidget(ButtonsTabBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      _updateTabController();
    }

    if (widget.tabs.length > oldWidget.tabs.length) {
      final int delta = widget.tabs.length - oldWidget.tabs.length;
      _tabKeys.addAll(List<GlobalKey>.generate(delta, (int n) => GlobalKey()));
    } else if (widget.tabs.length < oldWidget.tabs.length) {
      _tabKeys.removeRange(widget.tabs.length, oldWidget.tabs.length);
    }
  }

  void _handleController() {
    if (_controller!.indexIsChanging) {
      // update highlighted index when controller index is changing
      _goToIndex(_controller!.index);
    }
  }

  @override
  void dispose() {
    if (_controllerIsValid) {
      _controller!.animation!.removeListener(_handleTabAnimation);
      _controller!.removeListener(_handleController);
    }
    _controller = null;
    _scrollController.dispose();
    super.dispose();
  }

  _getCenterPadding(BuildContext context) {
    // get the screen width. This is used to check if we have an element off screen
    final RenderBox tabsParent =
        _tabsParentKey.currentContext!.findRenderObject() as RenderBox;
    final double screenWidth = tabsParent.size.width;
    if (_tabKeys.first.currentContext?.findRenderObject() == null) {
      return;
    }
    RenderBox renderBox =
        _tabKeys.first.currentContext?.findRenderObject() as RenderBox;
    double size = renderBox.size.width;
    final double left = (screenWidth - size) / 2;

    renderBox = _tabKeys.last.currentContext?.findRenderObject() as RenderBox;
    size = renderBox.size.width;
    final double right = (screenWidth - size) / 2;
    _centerPadding = EdgeInsets.only(left: left, right: right);
  }

  Widget _buildButton(
    int index,
    Tab tab,
  ) {
    // final double animationValue;
    // if (index == _currentIndex) {
    //   animationValue = _animationController.value;
    // } else if (index == _prevIndex) {
    //   animationValue = 1 - _animationController.value;
    // } else {
    //   animationValue = 0;
    // }

    // final TextStyle? textStyle = index == _currentIndex ? TextStyle.lerp(
    //     widget.unselectedLabelStyle ?? const TextStyle(color: Colors.black),
    //     widget.labelStyle ?? const TextStyle(color: Colors.white),_animationController.value):
    //     TextStyle.lerp(
    //     widget.labelStyle ?? const TextStyle(color: Colors.white),
    //     widget.unselectedLabelStyle ?? const TextStyle(color: Colors.black),_animationController.value)
    //     ;
    // final Color? borderColor = Colors.transparent;

    final TextStyle? textStyle;
    final Color? borderColor;
    if (index == _currentIndex) {
      borderColor = widget.borderColor ?? Colors.transparent;
      textStyle = widget.labelStyle ?? const TextStyle(color: Colors.white);
    } else {
      borderColor = widget.unselectedBorderColor;
      textStyle =
          widget.unselectedLabelStyle ?? const TextStyle(color: Colors.black);
    }
    final Color foregroundColor = textStyle.color ?? Colors.black;
    final BoxDecoration? boxDecoration;
    if (_currentIndex == index) {
      boxDecoration = BoxDecoration(
          image: widget.itemBackgroundImageUrl != null
              ? widget.itemUnselectedBackgroundImageUrl!.isEmpty
                  ? null
                  : DecorationImage(
                      image: CachedNetworkImageProvider(
                          widget.itemBackgroundImageUrl!)
                        ..evict(),
                      //图片填充方式
                      fit: BoxFit.cover,
                      //图片位置
                      alignment: Alignment.topCenter,
                      //图片平铺方式
                      repeat: ImageRepeat.repeatY,
                    )
              : null,
          color: widget.itemBackgroundColor == null
              ? null
              : (widget.decoration?.color ??
                  widget.itemBackgroundColor ??
                  Colors.transparent),
          boxShadow: widget.decoration?.boxShadow,
          gradient: widget.decoration?.gradient,
          borderRadius: BorderRadius.circular(widget.itemRadius),
          border: Border.all(
              color: borderColor ?? Colors.transparent,
              width: widget.borderWidth,
              style: BorderStyle.solid));
    } else {
      boxDecoration = BoxDecoration(
          image: widget.itemUnselectedBackgroundImageUrl != null
              ? widget.itemUnselectedBackgroundImageUrl!.isEmpty
                  ? null
                  : DecorationImage(
                      image: CachedNetworkImageProvider(
                          widget.itemUnselectedBackgroundImageUrl!)
                        ..evict(),
                      //图片填充方式
                      fit: BoxFit.cover,
                      //图片位置
                      alignment: Alignment.topCenter,
                      //图片平铺方式
                      repeat: ImageRepeat.repeatY,
                    )
              : null,
          color: widget.itemUnselectedBackgroundColor == null
              ? null
              : (widget.unselectedDecoration?.color ??
                  widget.itemUnselectedBackgroundColor ??
                  Colors.transparent),
          boxShadow: widget.unselectedDecoration?.boxShadow,
          gradient: widget.unselectedDecoration?.gradient,
          borderRadius: BorderRadius.circular(widget.itemRadius),
          border: Border.all(
              color: borderColor ?? Colors.transparent,
              width: widget.borderWidth,
              style: BorderStyle.solid));
    }
    return GetBuilder<HotSportTabBarBadgeController>(
        id: tab.text,
        builder: (controller) {
          int count = controller.getBadgeCountWithTitle(tab.text!);
          return Padding(
              key: _tabKeys[index],
              // padding for the buttons
              padding: EdgeInsets.zero, //widget.buttonMargin,
              child: sbadges.Badge(
                showBadge: count != 0,
                badgeStyle: sbadges.BadgeStyle(
                  shape: sbadges.BadgeShape.circle,
                  borderRadius: BorderRadius.circular(5),
                  padding: const EdgeInsets.all(5),
                  badgeGradient: const sbadges.BadgeGradient.linear(
                    colors: [
                      Colors.red,
                      Colors.redAccent,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                badgeContent: Text(count.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 10)),
                child: TextButton(
                  onPressed: () {
                    _controller?.animateTo(index);
                    if (widget.onTap != null) widget.onTap!(index);
                  },
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(widget.elevation),
                      minimumSize: MaterialStateProperty.all(
                          Size(widget.buttonWidth, widget.buttonHeight)),
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                      textStyle: MaterialStateProperty.all(textStyle),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      overlayColor:
                          MaterialStateProperty.all(widget.splashColor)),
                  child: Ink(
                    decoration: boxDecoration,
                    child: Container(
                      width: widget.buttonWidth.toDouble(),
                      height: widget.buttonHeight.toDouble(),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          tab.icon != null
                              ? IconTheme.merge(
                                  data: IconThemeData(
                                      size: 24.0, color: foregroundColor),
                                  child: tab.icon!)
                              : Container(),
                          SizedBox(
                            width: tab.icon == null ||
                                    (tab.text == null && tab.child == null)
                                ? 0
                                : widget.labelSpacing,
                          ),
                          tab.text != null
                              ? Expanded(
                                  child: Center(
                                    child: Text(
                                      tab.text!,
                                      maxLines: 1,
                                      //overflow: TextOverflow.clip,
                                      style: textStyle,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                )
                              : (tab.child ?? Container())
                        ],
                      ),
                    ),
                  ),
                ),
              ));
        });
  }

  bool get showSeparator {
    return widget.separatorType != 0;
  }

  @override
  Widget build(BuildContext context) {
    assert(() {
      if (_controller!.length != widget.tabs.length) {
        throw FlutterError(
            "Controller's length property (${_controller!.length}) does not match the "
            "number of tabs (${widget.tabs.length}) present in TabBar's tabs property.");
      }
      return true;
    }());
    if (_controller!.length == 0) return Container(height: widget.height);

    _textLTR = Directionality.of(context).index == 1;
    return LayoutBuilder(builder: (context, constraints) {
      return Opacity(
        // avoid showing the tabBar if centering was request and the centerPadding wasn't calculated yet
        opacity: (!widget.center || _centerPadding != EdgeInsets.zero) ? 1 : 0,
        child: Container(
          decoration: BoxDecoration(
            image: widget.backgroundImageUrl != null
                ? DecorationImage(
                    image:
                        CachedNetworkImageProvider(widget.backgroundImageUrl!)
                          ..evict(),
                    //图片填充方式
                    fit: BoxFit.cover,
                    //图片位置
                    alignment: Alignment.topCenter,
                    //图片平铺方式
                    repeat: ImageRepeat.repeatY,
                  )
                : null,
            color: widget.backgroundImageUrl != null
                ? null
                : widget.backgroundColor ?? Colors.transparent,
            boxShadow: widget.unselectedDecoration?.boxShadow,
            gradient: widget.unselectedDecoration?.gradient,
            borderRadius: BorderRadius.circular(widget.radius),
          ),
          child: AnimatedBuilder(
            animation: _animationController,
            key: _tabsParentKey,
            builder: (context, child) => SizedBox(
              key: _tabsContainerKey,
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              // height: widget.preferredSize.height,
              child: SizedBox(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: Padding(
                  padding: constraints.maxWidth > constraints.maxHeight
                      ? EdgeInsets.symmetric(horizontal: widget.contentMargin)
                      : EdgeInsets.symmetric(vertical: widget.contentMargin),
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context)
                        .copyWith(scrollbars: false),
                    child: SingleChildScrollView(
                        physics: widget.physics,
                        controller: _scrollController,
                        scrollDirection:
                            constraints.maxWidth > constraints.maxHeight
                                ? Axis.horizontal
                                : Axis.vertical,
                        child: constraints.maxWidth > constraints.maxHeight
                            ? Row(
                                children: List.generate(widget.tabs.length,
                                    (int index) {
                                return Row(
                                  children: [
                                    _buildButton(
                                        index, widget.tabs[index] as Tab),
                                    SizedBox(
                                      width: widget.runSpacing,
                                    )
                                  ],
                                );
                              }))
                            : Column(
                                children: List.generate(widget.tabs.length,
                                    (int index) {
                                return Column(
                                  children: [
                                    _buildButton(
                                        index, widget.tabs[index] as Tab),
                                    SizedBox(
                                      height: widget.runSpacing,
                                    )
                                  ],
                                );
                              }))),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  // runs during the switching tabs animation
  _handleTabAnimation() {
    _aniIndex = ((_controller!.animation!.value > _prevAniValue)
            ? _controller!.animation!.value
            : _prevAniValue)
        .round();
    if (!_controller!.indexIsChanging && _aniIndex != _currentIndex) {
      _setCurrentIndex(_aniIndex);
    }
    _prevAniValue = _controller!.animation!.value;
  }

  _goToIndex(int index) {
    if (index != _currentIndex) {
      _setCurrentIndex(index);
      _controller?.animateTo(index);
      // navController.index = index;
    }
  }

  _setCurrentIndex(int index) {
    // change the index
    setState(() {
      // _prevIndex = _currentIndex;
      _currentIndex = index;
    });
    _scrollTo(index); // scroll TabBar if needed
    _triggerAnimation();
  }

  _triggerAnimation() {
    // reset the animation so it's ready to go
    _animationController.reset();

    // run the animation!
    _animationController.forward();
  }
  //....

  double _tabScrollOffset(
      int index, double viewportWidth, double minExtent, double maxExtent) {
    final RenderBox tabsContainer =
        _tabsContainerKey.currentContext!.findRenderObject() as RenderBox;
    bool horizontal = tabsContainer.size.width > tabsContainer.size.height;
    if (horizontal) {
      //组件的宽度
      //double screenWidth = tabsContainer.size.width;
      final tabsContainerPosition = tabsContainer.localToGlobal(Offset.zero).dx;
      final tabsContainerOffset = Offset(-tabsContainerPosition, 0);
      RenderBox buttonRenderBox =
          _tabKeys[index].currentContext?.findRenderObject() as RenderBox;
      // get its size
      double size = buttonRenderBox.size.width;
      // // and position
      double position = buttonRenderBox.localToGlobal(tabsContainerOffset).dx;
      double tabCenter = 0;
      if (index > _aniIndex) {
        //像前点击
        RenderBox buttonNextRenderBox =
            _tabKeys[index + 1].currentContext?.findRenderObject() as RenderBox;
        double positionNext =
            buttonNextRenderBox.localToGlobal(tabsContainerOffset).dx;
        tabCenter = (position + positionNext) / 2.0 - size;
      } else {
        //像后点击
        RenderBox buttonLastRenderBox = _tabKeys[(index == 0 ? 1 : index) - 1]
            .currentContext
            ?.findRenderObject() as RenderBox;
        double positionLast =
            buttonLastRenderBox.localToGlobal(tabsContainerOffset).dx;
        tabCenter = (position - positionLast) / 2.0;
      }
      double paddingStart = widget.contentMargin;
      return clampDouble(
          tabCenter +
              paddingStart -
              viewportWidth / 2.0 +
              _scrollController.offset,
          minExtent,
          maxExtent);
    } else {
      //组件的宽度
      //double screenWidth = tabsContainer.size.height;
      final tabsContainerPosition = tabsContainer.localToGlobal(Offset.zero).dy;
      final tabsContainerOffset = Offset(0, -tabsContainerPosition);
      RenderBox buttonRenderBox =
          _tabKeys[index].currentContext?.findRenderObject() as RenderBox;
      // get its size
      double size = buttonRenderBox.size.height;
      // // and position
      double position = buttonRenderBox.localToGlobal(tabsContainerOffset).dy;
      double tabCenter = 0;
      if (index > _aniIndex) {
        //像前点击
        RenderBox buttonNextRenderBox =
            _tabKeys[index + 1].currentContext?.findRenderObject() as RenderBox;
        double positionNext =
            buttonNextRenderBox.localToGlobal(tabsContainerOffset).dy;
        tabCenter = (position + positionNext) / 2.0 - size;
      } else {
        //像后点击
        RenderBox buttonLastRenderBox = _tabKeys[(index == 0 ? 1 : index) - 1]
            .currentContext
            ?.findRenderObject() as RenderBox;
        double positionLast =
            buttonLastRenderBox.localToGlobal(tabsContainerOffset).dy;
        tabCenter = (position - positionLast) / 2.0;
      }
      double paddingStart = widget.contentMargin;
      return clampDouble(
          tabCenter +
              paddingStart -
              viewportWidth / 2.0 +
              _scrollController.offset,
          minExtent,
          maxExtent);
    }
  }

  double _tabCenteredScrollOffset(int index) {
    final ScrollPosition position = _scrollController!.position;
    return _tabScrollOffset(index, position.viewportDimension,
        position.minScrollExtent, position.maxScrollExtent);
  }

  void _scrollToCurrentIndex(int index) {
    final double offset = _tabCenteredScrollOffset(_currentIndex!);
    _scrollController
        .animateTo(offset, duration: kTabScrollDuration, curve: Curves.ease);
  }

  _scrollTo(int index) {
    _scrollToCurrentIndex(index);
    return;
    // get the screen width. This is used to check if we have an element off screen
    final RenderBox tabsContainer =
        _tabsContainerKey.currentContext!.findRenderObject() as RenderBox;

    bool horizontal = tabsContainer.size.width > tabsContainer.size.height;
    if (horizontal) {
      double screenWidth = tabsContainer.size.width;
      final tabsContainerPosition = tabsContainer.localToGlobal(Offset.zero).dx;
      // get the TabsContainer offset (for cases when padding is used)
      final tabsContainerOffset = Offset(-tabsContainerPosition, 0);

      // get the button we want to scroll to
      RenderBox renderBox =
          _tabKeys[index].currentContext?.findRenderObject() as RenderBox;
      // get its size
      double size = renderBox.size.width;
      // and position
      double position = renderBox.localToGlobal(tabsContainerOffset).dx;

      // this is how much the button is away from the center of the screen and how much we must scroll to get it into place
      double offset = (position + size / 2) - screenWidth / 2;

      if (offset < 0) {
        // get the first button
        renderBox = (_textLTR ? _tabKeys.first : _tabKeys.last)
            .currentContext
            ?.findRenderObject() as RenderBox;
        //// get the position of the first button of the TabBar
        position = renderBox.localToGlobal(tabsContainerOffset).dx;

        // if the offset pulls the first button away from the left side, we limit that movement so the first button is stuck to the left side
        if (!widget.center && position > offset) offset = position;
      } else {
        // if the button is to the right of the middle

        // get the last button
        renderBox = (_textLTR ? _tabKeys.last : _tabKeys.first)
            .currentContext
            ?.findRenderObject() as RenderBox;
        // get its position
        position = renderBox.localToGlobal(tabsContainerOffset).dx;
        // and size
        size = renderBox.size.width;

        // if the last button doesn't reach the right side, use it's right side as the limit of the screen for the TabBar
        if (position + size < screenWidth) screenWidth = position + size;

        // if the offset pulls the last button away from the right side limit, we reduce that movement so the last button is stuck to the right side limit
        if (!widget.center && position + size - offset < screenWidth) {
          offset = position + size - screenWidth;
        }
      }

      offset *= (_textLTR ? 1 : -1);

      var ssss = _scrollController.offset;
      var pp = offset + _scrollController.offset;
      // scroll the calculated ammount
      _scrollController.animateTo(offset + _scrollController.offset,
          duration: Duration(milliseconds: widget.duration),
          curve: Curves.easeInOut);
    } else {
      double screenWidth = tabsContainer.size.height;
      final tabsContainerPosition = tabsContainer.localToGlobal(Offset.zero).dy;
      // get the TabsContainer offset (for cases when padding is used)
      //final tabsContainerOffset = Offset(0, -tabsContainerPosition);
      final tabsContainerOffset =
          Offset(0, -tabsContainerPosition - widget.contentMargin);

      // get the button we want to scroll to
      RenderBox renderBox =
          _tabKeys[index].currentContext?.findRenderObject() as RenderBox;
      // get its size
      double size = renderBox.size.height;
      // and position
      double position = renderBox.localToGlobal(tabsContainerOffset).dy;

      // this is how much the button is away from the center of the screen and how much we must scroll to get it into place
      double offset = (position + size / 2) - screenWidth / 2;

      //if the button is to the left of the middle
      if (offset < 0) {
        renderBox = (_textLTR ? _tabKeys.first : _tabKeys.last)
            .currentContext
            ?.findRenderObject() as RenderBox;
        //// get the position of the first button of the TabBar
        position = renderBox.localToGlobal(tabsContainerOffset).dy;

        // if the offset pulls the first button away from the left side, we limit that movement so the first button is stuck to the left side
        if (!widget.center && position > offset) offset = position;
      } else {
        renderBox = (_textLTR ? _tabKeys.last : _tabKeys.first)
            .currentContext
            ?.findRenderObject() as RenderBox;
        // get its position
        position = renderBox.localToGlobal(tabsContainerOffset).dy;
        // and size
        size = renderBox.size.height;

        // if the last button doesn't reach the right side, use it's right side as the limit of the screen for the TabBar
        if (position + size < screenWidth) screenWidth = position + size;

        // if the offset pulls the last button away from the right side limit, we reduce that movement so the last button is stuck to the right side limit
        if (!widget.center && position + size - offset < screenWidth) {
          offset = position + size - screenWidth;
        }
      }
      offset *= (_textLTR ? 1 : -1);

      // scroll the calculated ammount
      _scrollController.animateTo(offset + _scrollController.offset,
          duration: Duration(milliseconds: widget.duration),
          curve: Curves.easeInOut);
    }
  }
}
