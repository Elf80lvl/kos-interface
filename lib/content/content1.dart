import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kos_interface/breakpoints.dart';
import 'package:kos_interface/components/inline_text.dart';
import 'package:kos_interface/components/insert_3d.dart';
import 'package:kos_interface/components/insert_grid_photo_gallery.dart';
import 'package:kos_interface/components/insert_important_text.dart';
import 'package:kos_interface/components/insert_paragraph.dart';
import 'package:kos_interface/components/insert_photo.dart';
import 'package:kos_interface/components/insert_photo_gallery.dart';
import 'package:kos_interface/components/insert_sequence.dart';
import 'package:kos_interface/components/insert_text.dart';
import 'package:kos_interface/components/insert_title.dart';
import 'package:kos_interface/components/launch_url.dart';
import 'package:kos_interface/const.dart';
import 'package:url_launcher/url_launcher.dart';

class Content1 extends StatelessWidget {
  const Content1({
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
              //* Перед началом работы необходимо
              //*1. создать папки и/или наполнить для хранения изображений и прочего, например:
              //* assets/sequence/monkey - папка с секвенцией изображений
              //* assets/sequence/cube - другая папка с секвенцией изображений
              //* assets/photos - изображения, фотографии
              //* assets/models - 3д модели
              //*2. Так как секвенции в разных папках, необходимо добавить путь к каждой папке c секвенциями в pubspec.yaml (не нужно если у вас нет секвенций)

              //TODO вставка видео
              //TODO вставка таблицы
              //TODO вставка штуки с подсвеченными элементами
              //TODO улучшить sequence, кэшрование?
              //TODO open pdf from assets

              //Название раздела
              InsertTitle('Примеры раздела, текста и прочего'),

              //Просто текст
              InsertText(
                  'Текст (от лат. textus — ткань; сплетение, сочетание) — зафиксированная на каком-либо материальном носителе человеческая мысль; в общем плане связная и полная последовательность символов.'),
              InsertText(
                  'Существуют две основные трактовки понятия «текст»: имманентная (расширенная, философски нагруженная) и репрезентативная (более частная). Имманентный подход подразумевает отношение к тексту как к автономной реальности, нацеленность на выявление его внутренней структуры. Репрезентативный — рассмотрение текста как особой формы представления информации о внешней тексту действительности.'),
              InsertTitle('Название другого раздела'),

              InsertText(
                  'В лингвистике термин «текст» используется в широком значении, включая и образцы устной речи. Восприятие текста изучается в рамках лингвистики текста и психолингвистики. Так, например, И. Р. Гальперин определяет текст следующим образом: «Это письменное сообщение, объективированное в виде письменного документа, состоящее из ряда высказываний, объединённых разными типами лексической, грамматической и логической связи, имеющее определённый моральный характер, прагматическую установку и соответственно литературно обработанное»[1].'),

              //Важный текст
              InsertImportantText(
                  'Главный тезис — текст состоит из двух или более предложений.'),

              InsertText(
                  'Текст, в своем роде, состоит из некоторого количества предложений. Одно предложение, даже очень распространённое, сложное, текстом назвать нельзя, поскольку текст можно разделить на самостоятельные предложения, а части предложения сочетаются по законам синтаксиса сложного предложения, но не текста.'),

              //Абзац текста с разным выделением в одну строку. Курсивом, жирный, ссылка
              InsertParagraph(
                [
                  normal('Пример использования'),
                  italic('курсива'),
                  normal('и'),
                  bold('жирного'),
                  normal('текста в одном абзаце.'),
                  normal('А также'),
                  link('ссылки.', 'https://www.google.ru/'),
                ],
              ),

              InsertTitle('Фотографии, картинки, схемы'),

              InsertText('Пример использования полноразмерного фото:'),

              //Вставка фото полноразмерного. sign - опционально, подпись под фото
              InsertPhoto(
                name: 'ben-lowe-sqdY_rJg8wg-unsplash.jpg',
                sign: 'Подпись фото',
              ),

              InsertText(
                  'Пример использования горизонтальной галлереи изображений:'),

              //галлерея изображений. Фотографии должны быть в папке assets/photos
              InsertPhotoGallery([
                '1.jpg',
                '2.jpg',
                '3.jpg',
                '4.jpg',
                '5.jpg',
                '6.jpg',
                '7.jpg',
                '8.jpg',
              ]),

              InsertText('Пример использования блочной галлереи изображений:'),

              //галлерея изображений в виде сетки. Фотографии должны быть в папке assets/photos
              InsertGridGallery([
                '1.jpg',
                '2.jpg',
                '3.jpg',
                '4.jpg',
                '5.jpg',
                '6.jpg',
                '7.jpg',
                '8.jpg',
              ]),

              InsertTitle('Примеры вставки трехмерных объектов'),

              Insert3D('monkey.obj'),

              InsertText('Пример секвенции изображений:'),

              //Вставка секвенции изображений. Файлы должны иметь следующий формат: "0001.png", "0002.png" и тд.
              //folderName - имя папки в папке assets/sequence.
              //fileType - расширение изображений, например 'png' или 'jpg'
              //max - количество изображений. На данный момент не рекомендуется вставлять более 10-15 изображений или не оптимизированных тяжеловесных картинок
              InsertSequence(folderName: 'monkey', fileType: 'png', max: 10),

              //! КОНЕЦ
            ],
          ),
        ),
      ),
    );
  }
}


















              //кнопка на открытие 3д модели в новом окне.
              //"previewImage" - опционально. Путь к картинке, которая будет использоваться как превью,
              //можно взять картинку из секвенции если она есть или из папки assets/photos
              // Insert3D(
              //   modelName: 'monkey.obj',
              //   //previewImage: 'assets/sequence/monkey/0001.png',
              // ),

              // Insert3D(
              //   modelName: 'monkey.obj',
              //   previewImage: 'assets/sequence/monkey/0001.png',
              // ),