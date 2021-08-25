import 'package:flutter/material.dart';

class InsertTitle extends StatelessWidget {
  final String titleText;
  const InsertTitle(this.titleText);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(top: 32, bottom: 16),
        child: SelectableText(
          titleText,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
