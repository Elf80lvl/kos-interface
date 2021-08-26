import 'package:flutter/material.dart';
import 'package:kos_interface/components/full_screen_photo.dart';

class InsertPhoto extends StatelessWidget {
  final String photoUrl;
  final String sign;

  const InsertPhoto({required this.photoUrl, required this.sign});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FullScreenPhoto(photoUrl);
          }));
        },
        child: Center(
          child: Column(
            children: [
              Hero(
                  tag: 'imageHero',
                  child: MouseRegion(
                      cursor: SystemMouseCursors.zoomIn,
                      child: Image.asset(photoUrl))),
              SizedBox(height: 8.0),
              Text(
                sign,
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
