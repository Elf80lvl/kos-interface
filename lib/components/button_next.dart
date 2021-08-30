import 'package:flutter/material.dart';

class ButtonNext extends StatelessWidget {
  final Function() onTap;
  const ButtonNext(this.onTap);

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
