import 'package:flutter/material.dart';
import 'package:kos_interface/components/video_player/insert_video.dart';
import 'package:kos_interface/interface/breakpoints.dart';
import 'package:kos_interface/interface/const.dart';

import '../button_close.dart';

class FullScreenVideo extends StatefulWidget {
  final isFullScreen;
  final String videoName;
  const FullScreenVideo({this.isFullScreen, required this.videoName});

  @override
  _FullScreenVideoState createState() => _FullScreenVideoState();
}

class _FullScreenVideoState extends State<FullScreenVideo> {
  int _quarterTurns = 0;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBGcolor,
      body: RotatedBox(
        quarterTurns: _quarterTurns,
        child: Center(
          child: Stack(
            children: [
              InsertVideo(
                isFullScreen: widget.isFullScreen,
                videoName: widget.videoName,
              ),
              Positioned(
                  top: 32,
                  right: 32,
                  child: Row(
                    children: [
                      //rotation button
                      if (screenWidth < kDestopBreakpoint)
                        InkResponse(
                          onTap: () {
                            _quarterTurns == 1
                                ? _quarterTurns = 0
                                : _quarterTurns = 1;
                            setState(() {});
                          },
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: kButtonCloseColor,
                              shape: BoxShape.circle,
                              // ],
                            ),
                            child: Icon(
                              _quarterTurns == 0
                                  ? Icons.rotate_right
                                  : Icons.rotate_left,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      SizedBox(width: 16),
                      ButtonClose(),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
