import 'package:flutter/material.dart';
import 'package:kos_interface/components/button_fullscreen.dart';
import 'package:kos_interface/interface/breakpoints.dart';
import '../interface/const.dart';
import 'full_screen_scheme.dart';

class InsertScheme extends StatefulWidget {
  final String scheme;
  final Map elements;
  final String buttonTitle;
  const InsertScheme(
      {required this.scheme,
      required this.elements,
      this.buttonTitle = 'Интерактивная схема'});

  @override
  _InsertSchemeState createState() => _InsertSchemeState();
}

class _InsertSchemeState extends State<InsertScheme>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  var currentIndex = 0;

  @override
  void initState() {
    _animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          Center(
            child: Stack(
              children: [
                ClipRRect(
                    borderRadius: kBorderRadius,
                    child: Image.asset('assets/photos/${widget.scheme}')),
                FadeTransition(
                  opacity: _animationController,
                  child: Image.asset(
                      'assets/photos/${widget.elements.keys.toList()[currentIndex]}'),
                ),

                //*fullscreen button
                if (screenWidth >= kDestopBreakpoint)
                  Positioned(
                      bottom: 8,
                      right: 8,
                      child: ButtonFullScreen(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return FullScreenScheme(
                                widget.scheme,
                                widget.elements,
                              );
                            },
                          ),
                        );
                      })),
              ],
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.elements.keys.toList().length,
                  itemBuilder: (context, index) {
                    return MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          currentIndex = index;
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: kBorderRadius,
                            color: currentIndex == index
                                ? kMainBlueColor
                                : Colors.transparent,
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.elements.values.toList()[index],
                            style: TextStyle(
                                color: currentIndex == index
                                    ? Colors.white
                                    : kMainBlueColor),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}



//* version with button
// import 'package:flutter/material.dart';

// import '../const.dart';
// import 'full_screen_scheme.dart';

// class InsertScheme extends StatelessWidget {
//   final String scheme;
//   final Map elements;
//   final String buttonTitle;
//   const InsertScheme(
//       {required this.scheme,
//       required this.elements,
//       this.buttonTitle = 'Интерактивная схема'});

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(
//         buttonTitle,
//         style: TextStyle(color: kMainBlueColor),
//       ),
//       leading: Icon(
//         Icons.vertical_split,
//         color: kMainBlueColor,
//       ),
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) {
//               return FullScreenScheme(
//                 scheme,
//                 elements,
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }





