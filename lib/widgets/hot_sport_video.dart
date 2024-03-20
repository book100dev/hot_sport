part of hot_sport;

class HotSportVideo extends HotSportWidget {
  final String content;
  const HotSportVideo({super.key, super.componetOption, required this.content});

  @override
  double get defaultWidth => ComponetType.video.size.width;

  @override
  double get defaultHight => ComponetType.video.size.height;

//https://via.placeholder.com/300.png/09f/fff?text=Video
  @override
  Widget get snapshot => hotSportInterface.isHotSportBuildersRegistered
      ? SizedBox(
          width: ComponetType.video.size.width,
          height: ComponetType.video.size.height,
          child: const Center(child: Icon(Icons.play_circle_outline_outlined)),
        )
      : Center(
          child: ExtendedImage.network(
              'http://via.placeholder.com/${ComponetType.image.size.width}x${ComponetType.image.size.height}.png/09f/fff?text=Video'));

  @override
  Widget child() => HotSportVideoPlayer(url: content);
}

class HotSportVideoPlayer extends StatefulWidget {
  const HotSportVideoPlayer({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  State<HotSportVideoPlayer> createState() => _HotSportVideoPlayerState();
}

class _HotSportVideoPlayerState extends State<HotSportVideoPlayer> {
  VideoPlayerController? _controller;
  HotSportVideoController? _hotSportVideoController;
  // late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    if (Get.isRegistered<HotSportVideoController>()) {
      _hotSportVideoController = Get.find<HotSportVideoController>();
    } else {
      _hotSportVideoController = HotSportVideoController();
    }
    _initPalyController();
  }

  void _initPalyController() {
    if (widget.url.isNotEmpty) {
      try {
        _controller = VideoPlayerController.networkUrl(Uri.parse(widget.url));
        _controller?.initialize().then((value) {
          if (_controller!.value.isInitialized) {
            _controller?.play();
            _controller?.addListener(() {
              // print('监听中啊。。。。。${_controller!.value.isPlaying}');
              // print('position。。。。。${_controller!.value.position}');
              // print('duration。。。。。${_controller!.value.duration}');
              if (!_controller!.value.isPlaying &&
                  _controller!.value.position == _controller!.value.duration) {
                // print('监听中啊。。。。。zhixing');
                _controller!.seekTo(Duration.zero);
                _controller!.play();
              }
            });
            setState(() {
              //..
            });
          } else {
            print("video file load failed");
            _controller?.dispose();
            _controller = null;
          }
        }).catchError((e) {
          print("controller.initialize() error occurs: $e");
        });
      } catch (_) {
        //..
      }
    }
  }

  @override
  void dispose() {
    _controller?.pause();
    _controller?.removeListener(() {});
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.url.isEmpty) {
      return SizedBox(
        width: ComponetType.video.size.width,
        height: ComponetType.video.size.height,
        child: const Center(child: Icon(Icons.play_circle_outline_outlined)),
      );
    }

    if (widget.url != _controller?.dataSource) {
      _controller?.pause();
      _controller?.dispose();
      _initPalyController();
    }
    return GetBuilder<HotSportVideoController>(
      //id: '',
      init: _hotSportVideoController,
      builder: (getController) {
        //注册了HotSportVideoController 并且 不是编辑器
        if (Get.isRegistered<HotSportVideoController>() && !hotSportInterface.isHotSportBuildersRegistered) {
          if (getController.urls.isEmpty) {
            _controller!.seekTo(Duration.zero);
            _controller!.pause();
          } else if (getController.play(url: widget.url)) {
            _controller!.seekTo(Duration.zero);
            _controller!.play();
          }
        }
        return AspectRatio(
          aspectRatio: _controller?.value.aspectRatio ?? 1,
          child: AbsorbPointer(
              absorbing: kIsWeb ? true : false,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  VideoPlayer(_controller!),
                  if (Platform.isAndroid || Platform.isIOS)
                    _PlayPauseOverlay(controller: _controller!)
                ],
              )),
        );
      },
    );
  }
}

class _PlayPauseOverlay extends StatelessWidget {
  const _PlayPauseOverlay({Key? key, required this.controller})
      : super(key: key);

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? const SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: const Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 70.0,
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
      ],
    );
  }
}
