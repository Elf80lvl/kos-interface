import 'package:flutter/material.dart';
import 'package:kos_interface/breakpoints.dart';

class Content1 extends StatelessWidget {
  const Content1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 0),
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
                      'Это страница 1',
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
                      'Название раздела',
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
