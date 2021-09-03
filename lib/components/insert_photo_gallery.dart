import 'package:flutter/material.dart';
import 'package:kos_interface/components/button_next.dart';
import 'package:kos_interface/components/button_prev.dart';
import 'package:kos_interface/components/full_screen_photo_gallery.dart';
import 'package:kos_interface/interface/const.dart';

class InsertPhotoGallery extends StatefulWidget {
  final List<String> photos;

  const InsertPhotoGallery(this.photos);

  @override
  _InsertPhotoGalleryState createState() => _InsertPhotoGalleryState();
}

class _InsertPhotoGalleryState extends State<InsertPhotoGallery> {
  final controller = ScrollController();
  int item = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Stack(
        children: [
          Container(
            height: 150,
            child: ListView.builder(
              controller: controller,
              //physics: BouncingScrollPhysics(),
              itemCount: widget.photos.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ClipRRect(
                    borderRadius: kBorderRadius,
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return FullScreenPhotoGallery(
                                widget.photos[index], widget.photos);
                          }));
                        },
                        child: Image.asset(
                            'assets/photos/${widget.photos[index]}'),
                      ),
                    ),
                  ),
                );
              },
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
            ),
          ),
          Positioned(
              top: 59, //150 / 2 - 32 / 2,
              right: 8,
              child: ButtonNext(() {
                //scroll next
                controller.animateTo(controller.position.pixels + 300,
                    duration: Duration(milliseconds: 100),
                    curve: Curves.easeInOut);
              })),
          Positioned(
              top: 59, //150 / 2 - 32 / 2,
              left: 8,
              child: ButtonPrev(() {
                //scroll next
                controller.animateTo(controller.position.pixels - 300,
                    duration: Duration(milliseconds: 100),
                    curve: Curves.easeInOut);
              })),
        ],
      ),
    );
  }
}







// import 'package:flutter/material.dart';
// import 'package:kos_interface/components/full_screen_photo_gallery.dart';
// import 'package:kos_interface/const.dart';

// class InsertPhotoGallery extends StatelessWidget {
//   final List<String> photos;

//   const InsertPhotoGallery(this.photos);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 16),
//       child: Container(
//         height: 150,
//         child: ListView.builder(
//           physics: BouncingScrollPhysics(),
//           itemCount: photos.length,
//           itemBuilder: (context, index) {
//             return Padding(
//               padding: const EdgeInsets.only(right: 16),
//               child: ClipRRect(
//                 borderRadius: kBorderRadius,
//                 child: MouseRegion(
//                   cursor: SystemMouseCursors.click,
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) {
//                         return FullScreenPhotoGallery(photos[index], photos);
//                       }));
//                     },
//                     child: Image.asset('assets/photos/${photos[index]}'),
//                   ),
//                 ),
//               ),
//             );
//           },
//           scrollDirection: Axis.horizontal,
//           shrinkWrap: true,
//         ),
//       ),
//     );
//   }
// }