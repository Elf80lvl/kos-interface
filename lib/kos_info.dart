import 'package:flutter/material.dart';

import 'content/content1.dart';
import 'content/content2.dart';

//Название КОС
final String kosName =
    'Название компьютерной обучающей системы с очень очень очень длинным именем';
//Тип КОС (АОС, тренажер-имитатор, электронный учебник)
final String kosType = 'Компьютерная обучающая система';
//Год разработки
final String kosYear = '2021';
//Постановщики, сценаристы
final String writers = 'А.А. Иванов, В.В. Петров';
//Разработчики, программисты
final String developers = 'П.П. Сидоров, Н.Н. Кузнецов';
//Филиал
final String devFacility = 'ОП «Учебно-производственный центр»';

//список страниц кос
final List<Widget> contentList = [
  Content1(),
  Content2(),
  //Content3(),
  //Content4(),
  //Content5(),
  //Content6(),
  //Content7(),
  //..
];

//Cписок названий пунктов меню (страниц) кос
final List<String> menuItems = [
  'Первый пункт в меню',
  'Второй пункт меню',
  //'Третий пункт меню',
  //'4ый пункт меню',
  //'5ый пункт меню',
  //'6ый пункт меню',
  //'7ой пункт меню',
  //..
];
