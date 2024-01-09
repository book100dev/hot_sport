// import 'package:extended_image/extended_image.dart';
// import 'package:flutter/material.dart';
// import 'package:hot_sport/base/hot_sport_widget.dart';
// import 'package:hot_sport/data/componet_type.dart';
// import 'package:video_player/video_player.dart';

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
  const HotSportVideoPlayer({
    Key? key,
    required this.url,
  }) : super(key: key);
  final String url;

  @override
  State<HotSportVideoPlayer> createState() => _HotSportVideoPlayerState();
}

class _HotSportVideoPlayerState extends State<HotSportVideoPlayer> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.url),
    );
    _controller.setLooping(true);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.play();
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
        width: ComponetType.video.size.width,
        height: ComponetType.video.size.height,
        child: const Center(child: Icon(Icons.play_circle_outline_outlined)),
      );
    }
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If the VideoPlayerController has finished initialization, use
          // the data it provides to limit the aspect ratio of the video.
          return AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            // Use the VideoPlayer widget to display the video.
            child: AbsorbPointer(
              absorbing: kIsWeb ? true : false,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  VideoPlayer(_controller),
                  _PlayPauseOverlay(controller: _controller),
                ],
              ),
            ),
          );
        } else {
          // If the VideoPlayerController is still initializing, show a
          // loading spinner.
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
    // return AspectRatio(
    //   aspectRatio: _controller.value.aspectRatio,
    //   child: AbsorbPointer(
    //     absorbing: kIsWeb ? true : false,
    //     child: Stack(
    //       alignment: Alignment.bottomCenter,
    //       children: <Widget>[
    //         VideoPlayer(_controller),
    //         _PlayPauseOverlay(controller: _controller),
    //       ],
    //     ),
    //   ),
    // );
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
