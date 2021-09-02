import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kos_interface/breakpoints.dart';
import 'package:kos_interface/components/inline_text.dart';
import 'package:kos_interface/components/insert_3d.dart';
import 'package:kos_interface/components/insert_grid_photo_gallery.dart';
import 'package:kos_interface/components/insert_important_text.dart';
import 'package:kos_interface/components/insert_paragraph.dart';
import 'package:kos_interface/components/insert_photo.dart';
import 'package:kos_interface/components/insert_photo_gallery.dart';
import 'package:kos_interface/components/insert_scheme.dart';
import 'package:kos_interface/components/insert_sequence.dart';
import 'package:kos_interface/components/insert_text.dart';
import 'package:kos_interface/components/insert_title.dart';

class Content2 extends StatelessWidget {
  const Content2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          right: 16.0, left: 16.0, top: 0, bottom: 32.0 + 64.0),
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: kMaxBodyWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //! НАЧАЛО

              //Название раздела
              InsertTitle('Страница 2'),

              //Просто текст, блок с отступами сверху и снизу
              InsertText(
                  'Текст (от лат. textus — ткань; сплетение, сочетание) — зафиксированная на каком-либо материальном носителе человеческая мысль; в общем плане связная и полная последовательность символов.'),

              //! КОНЕЦ
            ],
          ),
        ),
      ),
    );
  }
}
