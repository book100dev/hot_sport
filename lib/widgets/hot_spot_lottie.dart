part of hot_sport;

class HotSportLottie extends HotSportWidget {
  final String content;
  const HotSportLottie(
      {super.key, super.componetOption, required this.content});

  @override
  double get defaultWidth => ComponetType.animation.size.width;

  @override
  double get defaultHight => ComponetType.animation.size.height;

  @override
  Widget get snapshot => hotSportInterface.isHotSportBuildersRegistered
      ? SizedBox(
          width: ComponetType.animation.size.width,
          height: ComponetType.animation.size.height,
          child: const Center(child: Icon(Icons.animation_rounded)),
        )
      : Center(
          child: ExtendedImage.network(
              'http://via.placeholder.com/${ComponetType.animation.size.width}x${ComponetType.animation.size.height}.png/09f/fff?text=Animation'));

  @override
  Widget child() => HotSportLottieContent(url: content);
}

class HotSportLottieContent extends StatefulWidget {
  const HotSportLottieContent({
    Key? key,
    required this.url,
  }) : super(key: key);
  final String url;

  @override
  State<HotSportLottieContent> createState() => _HotSportLottieContentState();
}

class _HotSportLottieContentState extends State<HotSportLottieContent>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.url.isEmpty) {
      return SizedBox(
        width: ComponetType.animation.size.width,
        height: ComponetType.animation.size.height,
        child: const Center(child: Icon(Icons.animation_rounded)),
      );
    }
    return Container(
      margin: const EdgeInsets.all(10),
      child: Lottie.network(
        widget.url,
        controller: _controller,
        onLoaded: (composition) {
          _controller
            ..duration = composition.duration
            ..forward();
        },
      ),
    );
  }
}
