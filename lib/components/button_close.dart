import 'package:flutter/material.dart';
import 'package:kos_interface/interface/const.dart';

class ButtonClose extends StatelessWidget {
  const ButtonClose({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: kButtonCloseColor,
          shape: BoxShape.circle,
          // boxShadow: [
          //   BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 2),
          // ],
        ),
        child: Icon(
          Icons.close,
          color: Colors.white,
        ),
      ),
    );
  }
}
