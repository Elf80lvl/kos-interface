import 'package:flutter/material.dart';
import 'package:kos_interface/breakpoints.dart';
import 'package:kos_interface/components/button_close.dart';

class FullScreenPhoto extends StatelessWidget {
  const FullScreenPhoto(this.name);

  final String name;

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
          //Если на десктопе то можно убрать фото из фуллскрина кликом и меняется курсор, если на мобилке то нельзя потому что будет мешать при жесте масштабирования
          MouseRegion(
            cursor: screenWidth > kDestopBreakpoint
                ? SystemMouseCursors.zoomOut
                : MouseCursor.defer,
            child: GestureDetector(
              onTap: () {
                if (screenWidth > kDestopBreakpoint) {
                  Navigator.pop(context);
                }
              },
              child: Center(
                child: Hero(
                  tag: 'imageHero',
                  child: InteractiveViewer(
                    child: Image.asset('assets/photos/$name'),
                  ),
                ),
              ),
            ),
          ),
          Positioned(top: 32, right: 32, child: ButtonClose()),
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:kos_interface/breakpoints.dart';
// import 'package:kos_interface/components/button_close.dart';
// import 'package:photo_view/photo_view.dart';

// class FullScreenPhoto extends StatelessWidget {
//   const FullScreenPhoto(this.name);

//   final String name;

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             child: Hero(
//               tag: 'imageHero',
//               child: PhotoView(
//                 imageProvider: AssetImage("assets/photos/$name"),
//               ),
//             ),
//           ),
//           Positioned(top: 32, right: 32, child: ButtonClose()),
//         ],
//       ),
//     );
//   }
// }
