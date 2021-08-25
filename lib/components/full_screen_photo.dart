import 'package:flutter/material.dart';

class FullScreenPhoto extends StatelessWidget {
  const FullScreenPhoto(this.photoUrl);

  final String photoUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Stack(children: [
          Positioned.fill(
              child: Container(
            color: Colors.black.withOpacity(0.7),
          )),
          Center(
            child: Hero(
              tag: 'imageHero',
              child: InteractiveViewer(
                  child: MouseRegion(
                      cursor: SystemMouseCursors.zoomOut,
                      child: Image.asset(photoUrl))),
            ),
          ),
        ]),
      ),
    );
  }
}
