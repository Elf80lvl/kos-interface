import 'package:flutter/material.dart';
import 'package:kos_interface/breakpoints.dart';
import 'package:kos_interface/components/button_close.dart';
import 'package:kos_interface/const.dart';

class FullScreenScheme extends StatefulWidget {
  final String scheme;
  final Map elements;
  const FullScreenScheme(this.scheme, this.elements);

  @override
  _FullScreenSchemeState createState() => _FullScreenSchemeState();
}

class _FullScreenSchemeState extends State<FullScreenScheme>
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
    final screenHeight = MediaQuery.of(context).size.height;
    return screenWidth <= kDestopBreakpoint
        //! mobile
        ? Scaffold(
            backgroundColor: kBGcolor,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        Image.asset('assets/photos/${widget.scheme}'),
                        FadeTransition(
                          opacity: _animationController,
                          child: Image.asset(
                              'assets/photos/${widget.elements.keys.toList()[currentIndex]}'),
                        ),
                        Positioned(top: 32, right: 32, child: ButtonClose()),
                      ],
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, right: 8.0, left: 8.0),
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: widget.elements.keys.toList().length,
                          itemBuilder: (context, index) {
                            return Card(
                              color: currentIndex == index
                                  ? kMainBlueColor
                                  : Colors.white,
                              child: ListTile(
                                title: Text(
                                  widget.elements.values.toList()[index],
                                  style: TextStyle(
                                      color: currentIndex == index
                                          ? Colors.white
                                          : kMainBlueColor),
                                ),
                                onTap: () {
                                  currentIndex = index;
                                  setState(() {});
                                },
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
          )
        //! desktop
        : Scaffold(
            backgroundColor: kBGcolor,
            body: Row(
              children: [
                Flexible(
                  flex: 3,
                  child: Center(
                    child: Stack(
                      children: [
                        Image.asset('assets/photos/${widget.scheme}'),
                        FadeTransition(
                          opacity: _animationController,
                          child: Image.asset(
                              'assets/photos/${widget.elements.keys.toList()[currentIndex]}'),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    height: screenHeight,
                    child: Stack(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 64.0, right: 8.0, left: 8.0),
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: widget.elements.keys.toList().length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    color: currentIndex == index
                                        ? kMainBlueColor
                                        : Colors.white,
                                    child: ListTile(
                                      title: Text(
                                        widget.elements.values.toList()[index],
                                        style: TextStyle(
                                            color: currentIndex == index
                                                ? Colors.white
                                                : kMainBlueColor),
                                      ),
                                      onTap: () {
                                        currentIndex = index;
                                        setState(() {});
                                      },
                                    ),
                                  );
                                }),
                          ),
                        ),
                        Positioned(top: 32, right: 32, child: ButtonClose()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
