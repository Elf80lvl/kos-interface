import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:kos_interface/breakpoints.dart';
import 'package:kos_interface/components/button_close.dart';

class FlutterCube extends StatefulWidget {
  final double size;
  final bool isLight;
  final modelName;
  const FlutterCube(
      {Key? key, required this.size, this.modelName, required this.isLight})
      : super(key: key);

  @override
  _FlutterCubeState createState() => _FlutterCubeState();
}

class _FlutterCubeState extends State<FlutterCube> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Container(
            color: Colors.black.withOpacity(0.8),
          )),
          Center(
            child: Cube(
              onSceneCreated: (Scene scene) {
                scene.world.add(
                  Object(
                    fileName: 'assets/models/${widget.modelName}',
                    lighting: widget.isLight,
                  ),
                );
                //уменьшить размер модели если на мобилке
                screenWidth <= kDestopBreakpoint
                    ? scene.camera.zoom = widget.size - 2
                    : scene.camera.zoom = widget.size;
              },
            ),
          ),
          Positioned(
            right: 32,
            top: 32,
            child: ButtonClose(),
          ),
        ],
      ),
    );
  }
}
