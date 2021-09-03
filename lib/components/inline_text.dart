import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../interface/const.dart';
import 'launch_url.dart';

TextSpan link(String text, String link) {
  return TextSpan(
      text: text,
      style: TextStyle(color: Colors.blue, fontSize: 18),
      recognizer: TapGestureRecognizer()
        ..onTap = () {
          launchUrl(link);
        });
}

TextSpan bold(String text) => TextSpan(text: '$text ', style: kBoldTextStyle);

TextSpan italic(String text) =>
    TextSpan(text: '$text ', style: kItalicTextStyle);

TextSpan normal(String text) =>
    TextSpan(text: '$text ', style: kDefaultTextStyle);
