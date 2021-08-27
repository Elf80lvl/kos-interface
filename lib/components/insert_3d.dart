import 'package:flutter/material.dart';
import 'package:kos_interface/components/flutter_cube.dart';

class Insert3D extends StatelessWidget {
  final String previewImage;
  final String modelName;
  const Insert3D({
    Key? key,
    this.previewImage = 'assets/images/cubeWhite.png',
    required this.modelName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return FlutterCube(modelName: modelName);
            }),
          );
        },
        child: Container(
          width: 150,
          height: 150,
          child: Stack(
            children: [
              Center(
                child: Image.asset(
                  previewImage,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  bottom: 5,
                  right: 20,
                  child: Image.asset('assets/images/handWhite.png'))
            ],
          ),
        ),
      ),
    );
  }
}
