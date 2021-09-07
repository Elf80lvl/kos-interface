import 'package:flutter/material.dart';
import 'package:kos_interface/interface/const.dart';

class InsertSequence extends StatefulWidget {
  //final String url = 'assets/sequence/';
  final String folderName;
  final int max;
  final String fileType;

  const InsertSequence(
      {Key? key,
      required this.folderName,
      required this.max,
      required this.fileType})
      : super(key: key);

  @override
  _InsertSequenceState createState() => _InsertSequenceState();
}

class _InsertSequenceState extends State<InsertSequence> {
  var name = 1;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          GestureDetector(
            onHorizontalDragUpdate: (details) {
              // //если крутим вправо
              // if (details.primaryDelta! > 0) {
              //   name >= widget.max
              //       ? name = widget.max
              //       : name = name + details.primaryDelta!.toInt();
              //   //если крутим влево
              // } else if (details.primaryDelta! < 0) {
              //   name <= 1
              //       ? name = 1
              //       : name = name + details.primaryDelta!.toInt();
              // }

              // setState(() {});
            },
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(
                  'assets/sequence/${widget.folderName}/${name.toString().padLeft(4, '0')}.${widget.fileType}'),
            ),
          ),
          Container(
            width: double.infinity,
            child: Slider.adaptive(
                activeColor: kMainBlueColor,
                //divisions: max,
                value: name.toDouble(),
                min: 1,
                max: widget.max.toDouble(),
                onChanged: (value) {
                  setState(() {
                    name = value.toInt();
                  });
                }),
          ),
        ],
      ),
    );
  }
}
