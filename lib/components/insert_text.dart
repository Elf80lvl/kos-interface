import 'package:flutter/material.dart';
import 'package:kos_interface/interface/const.dart';

class InsertText extends StatelessWidget {
  final String text;
  const InsertText(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SelectableText(
        text,
        style: TextStyle(
          fontSize: 18,
          height: kTextHeight,
        ),
      ),
    );
  }
}
