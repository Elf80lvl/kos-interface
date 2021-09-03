import 'package:flutter/material.dart';
import 'package:kos_interface/interface/breakpoints.dart';

class InsertTitle extends StatelessWidget {
  final String titleText;
  const InsertTitle(this.titleText);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 40),
      child: Align(
        alignment: screenWidth <= kDestopBreakpoint
            ? Alignment.centerLeft
            : Alignment.center,
        child: SelectableText(
          titleText,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
