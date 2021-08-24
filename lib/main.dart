import 'package:flutter/material.dart';
import 'package:kos_interface/bloc.dart';
import 'package:kos_interface/breakpoints.dart';
import 'package:kos_interface/const.dart';
import 'package:kos_interface/content/content1.dart';
import 'package:kos_interface/content/content2.dart';
import 'package:kos_interface/responsive_layout.dart';

void main() {
  runApp(MyApp());
}

//TODO кнопки пред и след окна
//TODO вставка фото с подписью и без
//TODO вставка видео
//TODO вставка крутилки

String kosName = 'Название компьютерной обучающей системы';
String kosYear = '2021';

//индекс текущего элемента списка со страницами кос, 0 - первая страница
int currentIndexContent = 0;

//список страниц кос
List<Widget> contentList = [
  Content1(),
  Content2(),
];

//текущая страница кос
Widget currentPage = contentList[currentIndexContent];

GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //*функция для кнопки назад и далее в bottomNavigationBar
  void onTappedBar(int index) {
    //если нажата кнопка назад
    if (index == 0) {
      currentIndexContent--;
      //не может быть меньше 0, т.к. 0 это первая страница
      if (currentIndexContent < 0) currentIndexContent++;
    }
    //если нажата средняя кнопка
    if (index == 1) {
      //currentPage = contentList[currentIndexContent];
      _drawerKey.currentState?.openEndDrawer();
    }
    //если нажата кнопка далее
    if (index == 2) {
      currentIndexContent++;
      //не может быть больше чем индекс последнего элемента списка т.к. это последняя страница кос
      if (currentIndexContent > contentList.length - 1) currentIndexContent--;
    }

    currentPage = contentList[currentIndexContent];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _drawerKey,
      body: ResponsiveLayout(
        mobileBody: MyCustomMobileContent(),
        desktopBody: MyCustomDesktopWidget(),
      ),
      appBar: AppBar(
        elevation: 2,
        leading: Padding(
          padding: screenWidth <= kDestopBreakpoint
              ? const EdgeInsets.symmetric(vertical: 8.0)
              : const EdgeInsets.only(left: 16, right: 5.0),
          child: screenWidth <= kDestopBreakpoint
              ? Image.asset('assets/images/gz_s.jpg')
              : Image.asset(
                  'assets/images/gzlogo.jpg',
                ),
        ),
        leadingWidth: screenWidth <= kDestopBreakpoint ? 56 : 140,
        toolbarHeight: screenWidth <= kDestopBreakpoint ? kToolbarHeight : 100,
        centerTitle: true,
        title: screenWidth <= kDestopBreakpoint
            ? Text(
                '$kosName',
                style: TextStyle(color: kMainBlueColor),
              )
            : RichText(
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(children: [
                  TextSpan(
                      text: '$kosName',
                      style: TextStyle(
                          color: kMainBlueColor, fontSize: 22, height: 2)),
                  TextSpan(
                      text:
                          '\n© $kosYearг. ОП «Учебно-производственный центр» ООО «Газпром трансгаз Ухта»',
                      style: TextStyle(color: Colors.grey))
                ])),

        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: kMainBlueColor),

        //чтобы контролировать размер иконки гамбургер меню
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.menu,
                size: screenWidth <= kDestopBreakpoint ? 24 : 32,
              ),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: 'Открыть меню',
              //tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),

          //отступ справа от иконки меню
          SizedBox(
            width: screenWidth <= kDestopBreakpoint ? 8 : 16,
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text(
                'Первый пункт меню',
              ),
              onTap: () {
                currentIndexContent = 0;
                currentPage = contentList[currentIndexContent];
                setState(() {});
                print(currentPage);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Второй пункт меню'),
              onTap: () {
                currentIndexContent = 1;
                currentPage = contentList[currentIndexContent];
                setState(() {});
                print(currentPage);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      //* BOTTOM NAVIGATION
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        type: BottomNavigationBarType.fixed,
        //showSelectedLabels: false,
        //showUnselectedLabels: false,
        selectedItemColor: kMainBlueColor,
        unselectedItemColor: kMainBlueColor,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.navigate_before), label: 'Назад'),
          //текущая страница / всего страниц
          BottomNavigationBarItem(
              icon: Icon(Icons.format_list_numbered_rounded),
              label: '${currentIndexContent + 1} / ${contentList.length}'),
          BottomNavigationBarItem(
              icon: Icon(Icons.navigate_next), label: 'Далее'),
        ],
      ),
    );
  }
}

class MyCustomMobileContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: currentPage);
  }
}

class MyCustomDesktopWidget extends StatefulWidget {
  @override
  _MyCustomDesktopWidgetState createState() => _MyCustomDesktopWidgetState();
}

class _MyCustomDesktopWidgetState extends State<MyCustomDesktopWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 16),
          currentPage,
        ],
      ),
    );
  }
}
