import 'package:flutter/material.dart';

import '../const.dart';
import 'full_screen_scheme.dart';

class InsertScheme extends StatelessWidget {
  final String scheme;
  final Map elements;
  final String buttonTitle;
  const InsertScheme(
      {required this.scheme,
      required this.elements,
      this.buttonTitle = 'Открыть интерактивную схему'});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        buttonTitle,
        style: TextStyle(color: kMainBlueColor),
      ),
      leading: Icon(
        Icons.vertical_split,
        color: kMainBlueColor,
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return FullScreenScheme(
                scheme,
                elements,
              );
            },
          ),
        );
      },
    );
  }
}
