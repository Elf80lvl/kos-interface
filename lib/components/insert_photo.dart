import 'package:flutter/material.dart';
import 'package:kos_interface/components/full_screen_photo.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:kos_interface/const.dart';

class InsertPhoto extends StatelessWidget {
  final String name;
  final String sign;

  const InsertPhoto({required this.name, this.sign = ''});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FullScreenPhoto(name);
          }));
        },
        child: Center(
          child: Column(
            children: [
              Hero(
                tag: 'imageHero',
                child: MouseRegion(
                  cursor: SystemMouseCursors.zoomIn,
                  child: ClipRRect(
                    borderRadius: kBorderRadius,
                    child: CachedNetworkImage(
                      imageUrl: 'assets/photos/$name',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
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
