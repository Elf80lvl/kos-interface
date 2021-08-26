import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kos_interface/breakpoints.dart';
import 'package:kos_interface/components/flutter_cube.dart';
import 'package:kos_interface/components/insert_photo.dart';
import 'package:kos_interface/components/insert_text.dart';
import 'package:kos_interface/components/insert_title.dart';

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
              InsertText('Пример 3D модели:'),
              //InsertSequence(),

              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return FlutterCube();
                      }),
                    );
                  },
                  child: Text('Открыть 3D модель')),

              //*Отступ в конце
              SizedBox(height: 64),
            ],
          ),
        ),
      ),
    );
  }
}

class InsertSequence extends StatefulWidget {
  @override
  _InsertSequenceState createState() => _InsertSequenceState();
}

class _InsertSequenceState extends State<InsertSequence> {
  var name = 1;
  final url = 'assets/sequence/cube/';
  final int max = 100;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              print(name.toString().padLeft(4, '0'));
            },
            child: FadeInImage.assetNetwork(
                fadeInDuration: Duration(milliseconds: 1),
                fadeOutDuration: Duration(milliseconds: 1),
                placeholder: '$url${name.toString().padLeft(4, '0')}.png',
                image: '$url${name.toString().padLeft(4, '0')}.png'),
          ),
          Container(
            width: double.infinity,
            child: Slider.adaptive(
                value: name.toDouble(),
                min: 1,
                max: max.toDouble(),
                onChanged: (value) {
                  setState(() {
                    name = value.toInt();
                  });
                }),
          ),
        ],
      ),
    );
  }
}










        // ImageSequenceAnimator(
        //   'assets/sequence/example', 'file_', 1, 4, 'png', 4,
        //   key: Key("offline"),
        //   //isAutoPlay: true,
        //   //isLooping: true
        // ),

//imageSequenceAnimator!.skip(value);

// GestureDetector(
//             onHorizontalDragUpdate: (details) {
//               if (details.delta.dx > sensitivity) {
//                 // Right Swipe
//                 setState(() {
//                   name++;
//                   if (name > 4) name = 4;
//                   print(name);
//                 });
//               } else if (details.delta.dx < -sensitivity) {
//                 //Left Swipe
//                 setState(() {
//                   name--;
//                   if (name < 1) name = 1;
//                   print(name);
//                 });
//               }
//             },