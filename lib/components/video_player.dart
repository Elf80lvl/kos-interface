import 'package:flutter/material.dart';
import 'package:kos_interface/interface/breakpoints.dart';
import 'package:video_player/video_player.dart';

import 'full_screen_video.dart';

class AssetVideoPlayer extends StatefulWidget {
  final isFullScreen;
  final String videoName;
  AssetVideoPlayer({this.isFullScreen = false, required this.videoName});

  @override
  _AssetVideoPlayerState createState() => _AssetVideoPlayerState();
}

class _AssetVideoPlayerState extends State<AssetVideoPlayer> {
  late VideoPlayerController controller;
  late String url;
  bool isControlsVisible = false;

  @override
  void initState() {
    url = 'assets/video/${widget.videoName}';
    super.initState();
    controller = VideoPlayerController.asset(url)
      ..addListener(() {
        setState(() {});
      })
      ..initialize().then((value) {
        //controller.play();
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMuted = controller.value.volume == 0;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: widget.isFullScreen
          ? const EdgeInsets.all(0)
          : const EdgeInsets.symmetric(vertical: 16.0),
      child: AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: MouseRegion(
          onEnter: (event) {
            print('mouse detected');
            if (screenWidth >= kDestopBreakpoint) isControlsVisible = true;
            setState(() {});
          },
          onExit: (event) {
            if (screenWidth >= kDestopBreakpoint) {
              isControlsVisible = false;
              setState(() {});
            }
          },
          child: Stack(
            children: [
              VideoPlayerWidget(controller: controller),

              //*BG
              isControlsVisible
                  ? Positioned.fill(
                      child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.center,
                          colors: [
                            Colors.black,
                            Colors.transparent,
                            //Colors.transparent,
                          ],
                        ),
                      ),
                    ))
                  : Container(),

              //tap detector for mobile to show controls
              Positioned.fill(
                  child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        if (screenWidth <= kDestopBreakpoint) {
                          isControlsVisible
                              ? isControlsVisible = false
                              : isControlsVisible = true;
                        }
                        setState(() {});
                      },
                      child: Container(
                        color: Colors.transparent,
                      ))),

              //*controls
              if (controller != null && controller.value.isInitialized)
                isControlsVisible
                    ?
                    //*player buttons
                    Positioned(
                        bottom: 16.0,
                        left: 8.0,
                        child: Row(
                          children: [
                            // play/pause
                            IconButton(
                              color: Colors.white,
                              onPressed: () {
                                controller.value.isPlaying
                                    ? controller.pause()
                                    : controller.play();
                              },
                              icon: controller.value.isPlaying
                                  ? Icon(Icons.pause)
                                  : Icon(Icons.play_arrow),
                            ),

                            // Mute
                            IconButton(
                              // padding: const EdgeInsets.only(left: 16.0, right: 0.0),
                              // constraints: BoxConstraints(),
                              color: Colors.white,
                              onPressed: () {
                                controller.setVolume(isMuted ? 1 : 0);
                              },
                              icon: isMuted
                                  ? Icon(Icons.volume_off)
                                  : Icon(Icons.volume_up),
                            ),

                            // volume slider
                            Container(
                              width: 80,
                              child: SliderTheme(
                                data: SliderThemeData().copyWith(
                                  trackHeight: 1,
                                  overlayShape: RoundSliderOverlayShape(
                                      overlayRadius: 12),
                                  thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 6,
                                  ),
                                ),
                                child: Slider(
                                    activeColor: Colors.white,
                                    inactiveColor: Colors.grey,
                                    value: controller.value.volume,
                                    min: 0.0,
                                    max: 1.0,
                                    onChanged: (value) {
                                      controller.setVolume(value);
                                    }),
                              ),
                            ),

                            SizedBox(width: 16.0),

                            // current time and overall
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        '${controller.value.position.toString().substring(0, 7)}',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  TextSpan(
                                    text:
                                        ' / ${controller.value.duration.toString().substring(0, 7)}',
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(),

              //fullscreen button
              isControlsVisible
                  ? Positioned(
                      bottom: 16,
                      right: 8,
                      child: IconButton(
                        color: Colors.white,
                        onPressed: () {
                          if (widget.isFullScreen) {
                            Navigator.of(context).pop();
                          } else
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return FullScreenVideo(
                                  isFullScreen: true,
                                  videoName: widget.videoName);
                            }));
                        },
                        icon: widget.isFullScreen
                            ? Icon(
                                Icons.fullscreen_exit,
                              )
                            : Icon(
                                Icons.fullscreen,
                              ),
                      ),
                    )
                  : Container(),

              //* video progress
              isControlsVisible
                  ? Positioned.fill(
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 60,
                            right: 0,
                            left: 0,
                            child: VideoProgressIndicator(
                              controller,
                              allowScrubbing: true,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}

//******************** */
class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController controller;
  const VideoPlayerWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller != null && controller.value.isInitialized
        ? Container(
            alignment: Alignment.topCenter,
            child: buildVideo(),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  Widget buildVideo() => buildVideoPlayer();

  Widget buildVideoPlayer() => VideoPlayer(controller);
}










//https://stackoverflow.com/questions/53905812/how-do-i-change-the-position-in-the-video-in-flutter

// controller..initialize().then((_){         
//    setState(() {    
//      controller.play();    
//      controller.seekTo(controller.value.position + lastduration);
//    });
// });











      // onTap: () {
      //   print('dsf');
      //   isControlsVisible = true;
      //   setState(() {});
      //   Future.delayed(const Duration(seconds: 5), () {
      //     isControlsVisible = false;
      //     setState(() {});
      //   });
      // },