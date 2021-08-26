import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:kos_interface/breakpoints.dart';

class FlutterCube extends StatefulWidget {
  const FlutterCube({Key? key}) : super(key: key);

  @override
  _FlutterCubeState createState() => _FlutterCubeState();
}

class _FlutterCubeState extends State<FlutterCube> {
  double size = 8;
  late var zoom;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Container(
            color: Colors.black.withOpacity(0.7),
          )),
          Center(
            child: Cube(
              onSceneCreated: (Scene scene) {
                scene.world.add(
                  Object(
                    fileName: 'assets/models/monkey.obj',
                    lighting: true,
                  ),
                );
                scene.camera.zoom = size;
              },
            ),
          ),
          Positioned(
            right: 32,
            top: 32,
            child: InkResponse(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.close),
              ),
            ),
            // child: IconButton(

            //   iconSize: 32,
            //   color: Colors.grey[300],
            //   onPressed: () {
            //     Navigator.pop(context);
            //   },
            //   icon: Icon(Icons.close),
            // ),
          ),
        ],
      ),
    );
  }
}
