import 'package:flutter/material.dart';
import 'package:kos_interface/components/button_close.dart';
import 'package:kos_interface/components/button_next.dart';
import 'package:kos_interface/components/button_prev.dart';
import 'package:kos_interface/interface/const.dart';

class FullScreenPhotoGallery extends StatefulWidget {
  String photo;
  final List<String> photos;
  int indexOfNextPhoto = 0;
  int indexOfPrevPhoto = 0;

  FullScreenPhotoGallery(this.photo, this.photos);

  @override
  _FullScreenPhotoGalleryState createState() => _FullScreenPhotoGalleryState();
}

class _FullScreenPhotoGalleryState extends State<FullScreenPhotoGallery> {
  //final controller = ScrollController();

  void goNextPhoto() {
    widget.indexOfNextPhoto = widget.photos.indexOf(widget.photo) + 1;
    if (widget.indexOfNextPhoto == widget.photos.length) {
      widget.photo = widget.photos[0];
    } else {
      widget.photo = '${widget.photos[widget.indexOfNextPhoto]}';
    }
    setState(() {});
  }

  void goPrevPhoto() {
    widget.indexOfPrevPhoto = widget.photos.indexOf(widget.photo) - 1;
    if (widget.indexOfPrevPhoto < 0) {
      widget.photo = widget.photos.last;
    } else {
      widget.photo = widget.photos[widget.indexOfPrevPhoto];
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: kBGcolor,
        child: Column(
          children: [
            SizedBox(height: 16),
            Flexible(
              flex: 10,
              child: Stack(
                children: [
                  InteractiveViewer(
                    child: GestureDetector(
                      //* swipes
                      // onHorizontalDragEnd: (DragEndDetails details) {
                      //   if (details.primaryVelocity! > 0) {
                      //     //swipe Left
                      //     goPrevPhoto();
                      //   } else if (details.primaryVelocity! < 0) {
                      //     //swipe Right
                      //     goNextPhoto();
                      //   }
                      // },
                      child: Center(
                        child: Image.asset('assets/photos/${widget.photo}'),
                      ),
                    ),
                  ),

                  //* кнопка закрыть
                  Positioned(top: 32, right: 32, child: ButtonClose()),

                  //* button next
                  Positioned(
                      top: screenHeight / 2,
                      right: 32,
                      child: ButtonNext(() {
                        goNextPhoto();
                      })),

                  //* button prev
                  Positioned(
                      top: screenHeight / 2,
                      left: 32,
                      child: ButtonPrev(() {
                        goPrevPhoto();
                      })),
                ],
              ),
            ),
            SizedBox(height: 16),

            //* минигаллерея
            Flexible(
              child: Container(
                height: 150,
                child: ListView.builder(
                  //controller: controller,
                  itemCount: widget.photos.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            widget.photo = widget.photos[index];
                            setState(() {});
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                //выделяем border у текущей картинки
                                border: Border.all(
                                    width: 2.0,
                                    color:
                                        widget.photos.indexOf(widget.photo) ==
                                                index
                                            ? Colors.white
                                            : Colors.transparent),
                              ),
                              child: Image.asset(
                                  'assets/photos/${widget.photos[index]}')),
                        ),
                      ),
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                ),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
