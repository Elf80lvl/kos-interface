import 'package:flutter/material.dart';

class InsertParagraph extends StatelessWidget {
  final List<InlineSpan> list;

  const InsertParagraph(this.list);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SelectableText.rich(
        TextSpan(
          children: list,
        ),
      ),
    );
  }
}
