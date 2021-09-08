import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kos_interface/components/video_player/insert_video.dart';
import 'package:kos_interface/interface/breakpoints.dart';
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
import 'package:kos_interface/components/table_widgets.dart';
import 'package:kos_interface/interface/const.dart';

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
              //! НАЧАЛО РЕДАКТИРУЕМОЙ СТРАНИЦЫ С КОНТЕНТОМ
              //* Перед началом работы необходимо наполнить папки для хранения изображений и прочего, например:
              //*   assets/photos - изображения, фотографии
              //*   assets/models - 3д модели
              //*   assets/sequence/1 - папка с секвенцией изображений
              //*   assets/sequence/2 - другая папка с другой секвенцией, всего десять папок (переименовывать папки нельзя).
              //*   Если у вас больше 10ти секвенций, создайте дополнительные папки и добавьте пути в pubspec.yaml

              //TODO улучшить sequence, кэшрование?
              //TODO open pdf from assets
              //TODO audio files

              //Название раздела
              InsertTitle('Примеры раздела, текста и прочего'),

              //Просто текст, блок с отступами сверху и снизу
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

              //галлерея изображений горизонтальная прокручиваемая. Фотографии должны быть в папке assets/photos
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

              InsertText('Пример интерактивной схемы:'),

              //Интерактивная схема
              //scheme - имя основной схемы
              //elements - подсвечиваемые поверх схемы элементы "имя_фото": "Название кнопки"
              //buttonTitle - текст в кнопке (опционально)
              //Все файлы должны быть в папке assets/photos
              InsertScheme(
                scheme: 'cat.jpg',
                elements: {
                  "catBackPaws.png": "Задние парные опорные устройства",
                  "catEars.png": "Направляемые улавливатели шума",
                  "catEyes.png": "Приборы ночного видения",
                  "catFrontPaws.png": "Передние парные опорные устройства",
                  "catStomach.png": "Накопительный бак",
                  "catTail.png": "Стабилизатор равновесия",
                },
              ),

              InsertTitle('Примеры вставки трехмерных объектов'),

              InsertText('Кнопка открытия 3D модели в новом окне:'),

              //кнопка для 3D модели
              //modelName - название файла 3д в папке assets/models. Поддерживается только формат obj
              //size - размер модели. Если размер модели слишком большой или слишком маленький используйте парамаметр size(по умолчанию 8)
              //buttonTitle - текст в кнопке (не обязательно)
              //isLight - использовать освещение или нет
              Insert3D(modelName: 'cube.obj'),

              InsertText('Пример секвенции изображений:'),

              //Вставка секвенции изображений. Файлы должны иметь следующий формат: "0001.png", "0002.png" и тд.
              //folderName - имя папки в папке assets/sequence.
              //fileType - расширение изображений, например 'png' или 'jpg'
              //max - количество изображений. На данный момент не рекомендуется вставлять не оптимизированные тяжеловесные картинки
              InsertSequence(folderName: '1', fileType: 'png', max: 20),

              InsertTitle('Прочий тип контента'),

              InsertText('Прокручиваемая таблица:'),

              //Таблица, которая будет прокручиваться горизонтально при нехватке места на экране
              //*начало DataTable
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      headingRowColor: MaterialStateColor.resolveWith(
                          (states) => kTableColor),
                      columns: [
                        //названия колонок
                        dataColumn('Номер'),
                        dataColumn('Название'),
                        dataColumn('Цвет'),
                        dataColumn('Цена'),
                        dataColumn('Цена'),
                        dataColumn('Цена'),
                        dataColumn('Цена'),
                        dataColumn('Цена'),
                      ],
                      rows: [
                        //строка
                        DataRow(
                          cells: [
                            //ячейка
                            dataCell('1'),
                            dataCell('Клапан универсальный'),
                            dataCell('Синий'),
                            dataCell('56.000'),
                            dataCell('56.000'),
                            dataCell('56.000'),
                            dataCell('56.000'),
                            dataCell('56.000'),
                          ],
                        ),
                        DataRow(
                          cells: [
                            dataCell('2'),
                            dataCell('Уравнитель центробежный МК II'),
                            dataCell('Черный'),
                            dataCell('33.440'),
                            dataCell('33.440'),
                            dataCell('33.440'),
                            dataCell('33.440'),
                            dataCell('33.440'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //*конец DataTable

              InsertText('Видео:'),

              //Видео. Видеофайлы должны находиться в 'assets/video'
              //не используйте свойство isFullScreen, оно используется при переходе в новое окно и изменении вида и поведении кнопки fullscreen
              InsertVideo(videoName: 'zatvor.mp4'),

              //! КОНЕЦ РЕДАКТИРУЕМОЙ СТРАНИЦЫ С КОНТЕНТОМ
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
