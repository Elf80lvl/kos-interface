import 'package:flutter/material.dart';
import 'package:kos_interface/components/full_screen_photo_gallery.dart';
import 'package:kos_interface/const.dart';

class InsertPhotoGallery extends StatelessWidget {
  final List<String> photos;

  const InsertPhotoGallery(this.photos);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        height: 150,
        child: ListView.builder(
          itemCount: photos.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 16),
              child: ClipRRect(
                borderRadius: kBorderRadius,
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return FullScreenPhotoGallery(photos[index], photos);
                      }));
                    },
                    child: Image.asset('assets/photos/${photos[index]}'),
                  ),
                ),
              ),
            );
          },
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
        ),
      ),
    );
  }
}
