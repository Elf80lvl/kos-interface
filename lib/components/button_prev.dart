import 'package:flutter/material.dart';
import 'package:kos_interface/const.dart';

class ButtonPrev extends StatelessWidget {
  final Function() onTap;
  const ButtonPrev(this.onTap);

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: kButtonCloseColor, //Colors.white,
          shape: BoxShape.circle,
          // boxShadow: [
          //   BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 2),
          // ],
        ),
        child: Icon(
          Icons.navigate_before,
          color: Colors.white,
        ),
      ),
    );
  }
}
