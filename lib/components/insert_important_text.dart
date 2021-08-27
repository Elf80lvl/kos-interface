import 'package:flutter/material.dart';
import 'package:kos_interface/const.dart';

class InsertImportantText extends StatelessWidget {
  final String text;
  const InsertImportantText(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            kCornerRadius,
          ),
          color: Colors.black12,
        ),
        child: SelectableText(
          text,
          style: TextStyle(
              fontSize: 18,
              height: kTextHeight,
              //fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}
