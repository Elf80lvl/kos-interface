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

String kosName = 'Название компьютерной обучающей системы';
String kosYear = '2021';

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
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ResponsiveLayout(
        mobileBody: MyCustomMobileContent(),
        desktopBody: MyCustomDesktopWidget(),
      ),
      appBar: AppBar(
        leading: Padding(
          padding: screenWidth <= kDestopBreakpoint
              ? const EdgeInsets.symmetric(vertical: 8.0)
              : const EdgeInsets.only(left: 16, right: 5.0),
          child: screenWidth <= kDestopBreakpoint
              ? Image.asset('assets/images/gz_s.png')
              : Image.asset('assets/images/gzlogo.png'),
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
        elevation: 2,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: kMainBlueColor),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text(
                  'Первый первый раздел ноый вапмыва вапмывавапмыва вапмыва вапмыва вапмыва'),
              onTap: () {
                currentPage = Content1();
                setState(() {});
                print(currentPage);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                  '2 первый раздел ноый вапмыва вапмывавапмыва вапмыва вапмыва вапмыва'),
              onTap: () {
                currentPage = Content2();
                setState(() {});
                print(currentPage);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget currentPage = Content1();

class MyCustomMobileContent extends StatelessWidget {
  //final bloc = ContentBloc();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: currentPage);
    // return SingleChildScrollView(
    //     child: StreamBuilder(
    //   initialData: Content1(),
    //   stream: ContentBloc().contentStream,
    //   builder: (context, snapshot) {
    //     return Text('$snapshot.data');
    //   },
    // ));
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
          // //*шапка
          // Container(
          //   decoration: BoxDecoration(
          //     color: Theme.of(context).scaffoldBackgroundColor,
          //     boxShadow: [
          //       BoxShadow(
          //         color: Colors.grey.withOpacity(0.5),
          //         spreadRadius: 1,
          //         blurRadius: 1,
          //         //offset: Offset(0, 3), // changes position of shadow
          //       ),
          //     ],
          //   ),
          //   width: double.infinity,
          //   height: kHeaderHeight,
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          //     child: Row(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Image.asset('assets/images/gzlogo.png'),
          //         SizedBox(width: 32),
          //         Flexible(
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Flexible(
          //                 child: Text(
          //                   'Название компьютерной обучающей системы',
          //                   style:
          //                       TextStyle(color: kMainBlueColor, fontSize: 22),
          //                 ),
          //               ),
          //               SizedBox(height: 2),
          //               Text(
          //                 '© 2021г. ОП «Учебно-производственный центр» ООО «Газпром трансгаз Ухта»',
          //                 style: TextStyle(color: Colors.grey),
          //               ),
          //             ],
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // ),

          SizedBox(height: 32),

          currentPage,

          // //*контент и меню
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     //*контент
          //     currentPage,

          //     //* меню */
          //     Flexible(
          //       child: Container(
          //         decoration: BoxDecoration(
          //             //color: Colors.blue,
          //             border: Border(
          //                 left: BorderSide(
          //                     width: 0.5,
          //                     color: Colors.grey.withOpacity(0.4)))),
          //         child: Padding(
          //           padding:
          //               const EdgeInsets.only(left: 32, top: 32, bottom: 32),
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               MouseRegion(
          //                 cursor: SystemMouseCursors.click,
          //                 child: GestureDetector(
          //                   onTap: () {
          //                     currentPage = Content1();
          //                     setState(() {});
          //                   },
          //                   child: Padding(
          //                     padding: const EdgeInsets.only(bottom: 16),
          //                     child: Text(
          //                         'Первый раздел в меню в менюв менюв меню в меню',
          //                         style: TextStyle(
          //                             fontSize: 18, color: kMainBlueColor)),
          //                   ),
          //                 ),
          //               ),
          //               GestureDetector(
          //                 onTap: () {
          //                   currentPage = Content2();
          //                   setState(() {});
          //                 },
          //                 child: Padding(
          //                   padding: const EdgeInsets.only(bottom: 16),
          //                   child: Text('Второй раздел в меню',
          //                       style: TextStyle(
          //                           fontSize: 18, color: kMainBlueColor)),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
