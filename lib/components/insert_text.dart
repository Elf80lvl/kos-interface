import 'package:flutter/material.dart';

class InsertText extends StatelessWidget {
  final String text;
  const InsertText(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: SelectableText(
        text,
        style: TextStyle(fontSize: 18, height: 1.6),
      ),
    );
  }
}
