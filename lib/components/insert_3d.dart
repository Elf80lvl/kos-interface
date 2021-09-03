//кнопка маленькая
import 'package:flutter/material.dart';
import 'package:kos_interface/components/flutter_cube.dart';

import '../interface/const.dart';

class Insert3D extends StatelessWidget {
  final buttonTitle;
  final double size;
  final String modelName;
  final bool isLight;
  Insert3D(
      {required this.modelName,
      this.size = 5,
      this.buttonTitle = '3D модель',
      this.isLight = false});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        buttonTitle,
        style: TextStyle(color: kMainBlueColor),
      ),
      leading: Icon(
        Icons.threed_rotation_rounded,
        color: kMainBlueColor,
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return FlutterCube(
              modelName: modelName,
              size: size,
              isLight: isLight,
            );
          }),
        );
      },
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:kos_interface/components/flutter_cube.dart';

// class Insert3D extends StatelessWidget {
//   final String previewImage;
//   final String modelName;
//   const Insert3D({
//     Key? key,
//     this.previewImage = 'assets/images/cubeRender.png',
//     required this.modelName,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: InkResponse(
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) {
//               return FlutterCube(modelName: modelName);
//             }),
//           );
//         },
//         child: Stack(
//           children: [
//             Center(
//               child: Container(
//                 width: double.infinity,
//                 child: Image.asset(
//                   'assets/images/grid.jpg',
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             ),
//             Center(
//               child: Container(
//                 child: Image.asset(
//                   previewImage,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Positioned.fill(
//                 child: Center(
//                     child: Image.asset(
//               'assets/images/handWhite.png',
//               width: 300,
//             )))
//           ],
//         ),
//       ),
//     );
//   }
// }