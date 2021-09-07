import 'package:flutter/material.dart';
import 'package:kos_interface/interface/breakpoints.dart';
import 'package:kos_interface/interface/const.dart';
import 'package:kos_interface/interface/responsive_layout.dart';
import 'package:kos_interface/interface/splashscreen.dart';
import 'interface/dialog_kos_name.dart';
import 'kos_info.dart';

void main() {
  runApp(MyApp());
}

//изменяемый индекс текущего элемента списка со страницами кос, 0 - первая страница
int currentIndexContent = 0;

//текущая страница кос
Widget currentPage = contentList[currentIndexContent];

//ключ который будет присвоен Scaffold чтобы потом получить доступ к Scaffold в bottomNavigationBar чтобы оттуда открыть Drawer
GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kosName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: kMainBlueColor,
      ),
      home: SplashScreen(),
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
    //если нажата первая кнопка в BNB (кнопка назад)
    if (index == 0) {
      currentIndexContent--;
      //не может быть меньше 0, т.к. 0 это первая страница
      if (currentIndexContent < 0) currentIndexContent++;
    }
    //если нажата средняя кнопка
    if (index == 1) {
      //открыть меню
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
        automaticallyImplyLeading: false,
        elevation: 2,
        leading: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) {
                  return SplashScreen();
                }),
              );
            },
            child: Padding(
              padding: screenWidth <= kDestopBreakpoint
                  ? const EdgeInsets.symmetric(vertical: 8.0)
                  : const EdgeInsets.only(left: 16, right: 5.0),
              child: screenWidth <= kDestopBreakpoint
                  ? Image.asset('assets/images/gz.png')
                  : Image.asset(
                      'assets/images/gzlogo.png',
                    ),
            ),
          ),
        ),
        leadingWidth: screenWidth <= kDestopBreakpoint ? 56 : 140,
        toolbarHeight: screenWidth <= kDestopBreakpoint ? kToolbarHeight : 100,
        centerTitle: true,
        title: screenWidth <= kDestopBreakpoint
            ? GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return DialogKosName();
                      });
                },
                child: Text(
                  '$kosName',
                  maxLines: 2,
                  style: TextStyle(color: kMainBlueColor),
                ),
              )
            : RichText(
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(children: [
                  TextSpan(
                    text: '$kosName',
                    style: TextStyle(
                      color: kMainBlueColor, fontSize: 22,
                      //height: 2,
                    ),
                  ),
                  TextSpan(
                    text:
                        '\n© $kosYearг. $devFacility, ООО «Газпром трансгаз Ухта»',
                    style: TextStyle(
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),
                ])),

        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: kMainBlueColor),

        //чтобы контролировать размер иконки гамбургер меню
        actions: [
          Builder(
            builder: (context) => IconButton(
              iconSize: screenWidth <= kDestopBreakpoint ? 24 : 32,
              icon: Icon(
                Icons.menu,
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
        child: ListView.builder(
            itemCount: contentList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  menuItems[index],
                  style: TextStyle(
                      color: currentIndexContent == index
                          ? kMainBlueColor
                          : Colors.black),
                ),
                onTap: () {
                  //меняем индекс текущей страницы, меняем виджет текущей страницы соотвественно куда кликнули
                  currentIndexContent = index;
                  currentPage = contentList[currentIndexContent];
                  setState(() {});
                  Navigator.pop(context);
                },
              );
            }),
      ),

      //* FLOATING ACTION BUTTONS
      floatingActionButton: screenWidth <= kDestopBreakpoint
          ? null
          : Padding(
              padding: screenWidth <= kDestopBreakpoint
                  ? const EdgeInsets.all(0.0)
                  : const EdgeInsets.all(32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    heroTag: 'FABback', //чтобы избежать странной ошибки
                    backgroundColor: kMainBlueColor,
                    //backgroundColor: kMainBlueColor.withOpacity(0.9),
                    //elevation: 0,
                    tooltip: 'Назад',
                    onPressed: () {
                      currentIndexContent--;
                      //не может быть меньше 0, т.к. 0 это первая страница
                      if (currentIndexContent < 0) currentIndexContent++;
                      currentPage = contentList[currentIndexContent];
                      setState(() {});
                    },
                    child: Icon(Icons.navigate_before),
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        _drawerKey.currentState?.openEndDrawer();
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          //color: Theme.of(context).scaffoldBackgroundColor,
                          child: Text(
                            '${currentIndexContent + 1} / ${contentList.length}',
                            style: TextStyle(fontSize: 16),
                          )),
                    ),
                  ),
                  FloatingActionButton(
                    heroTag: 'FABnext',
                    backgroundColor: kMainBlueColor,
                    //backgroundColor: kMainBlueColor.withOpacity(0.9),
                    //elevation: 0,
                    tooltip: 'Далее',
                    onPressed: () {
                      currentIndexContent++;
                      //не может быть больше чем индекс последнего элемента списка т.к. это последняя страница кос
                      if (currentIndexContent > contentList.length - 1)
                        currentIndexContent--;
                      currentPage = contentList[currentIndexContent];
                      setState(() {});
                    },
                    child: Icon(Icons.navigate_next),
                  ),
                ],
              ),
            ),

      //* BOTTOM NAVIGATION
      bottomNavigationBar: screenWidth > kDestopBreakpoint
          ? null
          : SizedBox(
              height: screenWidth <= kDestopBreakpoint
                  ? kBottomNavigationBarHeight
                  : 80,
              child: BottomNavigationBar(
                onTap: onTappedBar,
                type: BottomNavigationBarType.fixed,
                selectedFontSize: 12,
                unselectedFontSize: 12,
                //showSelectedLabels: false,
                //showUnselectedLabels: false,
                selectedItemColor: kMainBlueColor,
                unselectedItemColor: kMainBlueColor,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.navigate_before,
                      ),
                      label: 'Назад'),
                  //текущая страница / всего страниц
                  BottomNavigationBarItem(
                    tooltip: 'Открыть меню',
                    icon: Icon(
                      Icons.format_list_numbered_rounded,
                    ),
                    label: '${currentIndexContent + 1} / ${contentList.length}',
                  ),

                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.navigate_next,
                      ),
                      label: 'Далее'),
                ],
              ),
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
