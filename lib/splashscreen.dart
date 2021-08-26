import 'package:flutter/material.dart';
import 'package:kos_interface/breakpoints.dart';
import 'package:kos_interface/const.dart';
import 'package:kos_interface/main.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff006fb7),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return MyHomePage();
            }),
          );
        },
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Center(
            child: Padding(
              padding: screenWidth <= kDestopBreakpoint
                  ? const EdgeInsets.all(16.0)
                  : const EdgeInsets.all(64.0),
              child: screenWidth <= kDestopBreakpoint
                  ? InfoBlock()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/logoBig2.jpg',
                          width: 400,
                        ),
                        Flexible(
                          child: InfoBlock(),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class InfoBlock extends StatelessWidget {
  const InfoBlock({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: screenWidth <= kDestopBreakpoint
          ? const EdgeInsets.all(16.0)
          : const EdgeInsets.all(32.0),
      color: Color(0xff1e85c5),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              kosType,
              style: TextStyle(color: Colors.white.withOpacity(0.6)),
            ),
            SizedBox(height: 8.0),
            Text(
              '$kosName',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            SizedBox(height: 32.0),
            Text(
              'Постановка: $writers',
              style: TextStyle(color: Colors.white.withOpacity(0.6)),
            ),
            SizedBox(height: 8.0),
            Text(
              'Разработка: $developers',
              style: TextStyle(color: Colors.white.withOpacity(0.6)),
            ),
            SizedBox(height: 8.0),
            Text(
              '© $devFacility',
              style: TextStyle(color: Colors.white.withOpacity(0.6)),
            ),
            SizedBox(height: 8.0),
            Text(
              'ООО "Газпром трансгаз Ухта". $kosYearг.',
              style: TextStyle(color: Colors.white.withOpacity(0.6)),
            ),
          ],
        ),
      ),
    );
  }
}
