import 'package:flutter/material.dart';
import 'package:kos_interface/components/button_close.dart';
import 'package:kos_interface/interface/const.dart';

class FullScreenPhoto extends StatelessWidget {
  const FullScreenPhoto(this.name);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Container(
            color: kBGcolor,
          )),
          InteractiveViewer(
            child: Center(
              child: Hero(
                tag: 'imageHero',
                child: Image.asset('assets/photos/$name'),
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
