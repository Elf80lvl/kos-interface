import 'package:flutter/material.dart';

import '../const.dart';
import 'full_screen_photo_gallery.dart';

class InsertGridGallery extends StatelessWidget {
  final List<String> photos;
  const InsertGridGallery(this.photos);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: photos.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, crossAxisSpacing: 8, mainAxisSpacing: 8),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ClipRRect(
                borderRadius: kBorderRadius,
                child: InkResponse(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return FullScreenPhotoGallery(photos[index], photos);
                    }));
                  },
                  child: FittedBox(
                    child: Image.asset('assets/photos/${photos[index]}'),
                    fit: BoxFit.fill,
                  ),
                ));
          },
        ),
      ),
    );
  }
}
