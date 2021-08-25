import 'package:flutter/material.dart';
import 'package:kos_interface/breakpoints.dart';

class Content2 extends StatelessWidget {
  const Content2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: kMaxBodyWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //* Название раздела */
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 32, bottom: 16),
                    child: Text(
                      'Это страница 2',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),

                //* Просто текст */
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    'content content content content content content content content content content content content content content content content content content content content content',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    'content content content content content content content content content content content content content content content content content content content content content',
                    style: TextStyle(fontSize: 18),
                  ),
                ),

                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 32, bottom: 16),
                    child: Text(
                      'Название',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    'content content content content content content content content content content content content content content content content content content content content content',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
