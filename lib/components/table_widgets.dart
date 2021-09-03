import 'package:flutter/material.dart';

import '../interface/const.dart';

class TableText extends StatelessWidget {
  final String text;
  const TableText(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8.0, bottom: 8.0),
      child: Text(text),
    );
  }
}

class TableTitle extends StatelessWidget {
  final String text;
  const TableTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kTableColor,
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

DataCell dataCell(String text) => DataCell(Text(text));

DataColumn dataColumn(String text) {
  return DataColumn(
    label: Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
  );
}










              // //Таблица
              // //https://medium.com/flutter-community/table-in-flutter-beyond-the-basics-8d31b022b451
              // //* начало Table
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 16.0),
              //   child: Table(
              //     border: TableBorder(
              //       bottom: BorderSide(color: kTableColor),
              //       horizontalInside: BorderSide(color: kTableColor),
              //     ),
              //     children: [
              //       TableRow(
              //         children: [
              //           TableTitle('Номер'),
              //           TableTitle('Название'),
              //           TableTitle('Цвет'),
              //           TableTitle('Цена'),
              //           TableTitle('Цена'),
              //           TableTitle('Цена'),
              //         ],
              //       ),
              //       TableRow(
              //         children: [
              //           TableText('1'),
              //           TableText('Уравнитель центробежный МК II'),
              //           TableText('Черный'),
              //           TableText('33.440'),
              //           TableText('33.440'),
              //           TableText('33.440'),
              //         ],
              //       ),
              //       TableRow(
              //         children: [
              //           TableText('2'),
              //           TableText('Клапан универсальный'),
              //           TableText('Синий'),
              //           TableText('56.000'),
              //           TableText('56.000'),
              //           TableText('56.000'),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              // //* конец Table
