import 'package:flutter/material.dart';
import 'package:kos_interface/interface/const.dart';

class BackGroundForControls extends StatelessWidget {
  const BackGroundForControls({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        height: 60,
        color: Colors.black.withOpacity(0.5),
      ),
    );
  }
}
