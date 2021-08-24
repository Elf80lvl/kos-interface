import 'package:flutter/material.dart';
import 'package:kos_interface/breakpoints.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    Key? key,
    required this.mobileBody,
    required this.desktopBody,
  }) : super(key: key);

  final Widget mobileBody;

  final Widget desktopBody;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, dimens) {
      if (dimens.maxWidth < kDestopBreakpoint) {
        return mobileBody;
      } else {
        return desktopBody;
      }
    });
  }
}
