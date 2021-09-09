import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BigPlayButtonCenter extends StatelessWidget {
  const BigPlayButtonCenter({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Center(
        child: GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.7),
            ),
            width: 68,
            height: 68,
            child: controller.value.isPlaying
                ? Icon(
                    Icons.pause,
                    size: 42,
                  )
                : Icon(
                    Icons.play_arrow,
                    size: 42,
                  ),
          ),
        ),
      ),
    );
  }
}
