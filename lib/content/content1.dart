import 'package:flutter/material.dart';
import 'package:kos_interface/breakpoints.dart';
import 'package:kos_interface/components/insert_photo.dart';
import 'package:kos_interface/components/insert_text.dart';
import 'package:kos_interface/components/insert_title.dart';
import 'package:model_viewer/model_viewer.dart';

class Content1 extends StatelessWidget {
  const Content1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          right: 16.0, left: 16.0, top: 0.0, bottom: 32.0),
      child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: kMaxBodyWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //* Название раздела */
                InsertTitle('Примеры раздела, текста и прочего'),

                //* Просто текст */
                InsertText(
                    'Зафиксированная на каком-либо материальном носителе человеческая мысль; в общем плане связная и полная последовательность символов. Существуют две основные трактовки понятия «текст»: имманентная (расширенная, философски нагруженная) и репрезентативная (более частная). Имманентный подход подразумевает отношение к тексту как к автономной реальности, нацеленность на выявление его внутренней структуры.'),
                InsertText('Пример использования фото:'),
                InsertPhoto(
                  photoUrl: 'assets/photos/ben-lowe-sqdY_rJg8wg-unsplash.jpg',
                  sign: 'Подпись фото',
                ),
              ],
            ),
          )),
    );
  }
}
