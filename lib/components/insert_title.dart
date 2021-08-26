import 'package:flutter/material.dart';
import 'package:kos_interface/breakpoints.dart';

class InsertTitle extends StatelessWidget {
  final String titleText;
  const InsertTitle(this.titleText);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Align(
      alignment: screenWidth <= kDestopBreakpoint
          ? Alignment.centerLeft
          : Alignment.center,
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
