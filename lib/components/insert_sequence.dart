import 'package:flutter/material.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              //print(name.toString().padLeft(4, '0'));
              print(widget.folderName);
            },
            child: FadeInImage.assetNetwork(
                fadeInDuration: Duration(milliseconds: 1),
                fadeOutDuration: Duration(milliseconds: 1),
                placeholder:
                    'assets/sequence/${widget.folderName}/${name.toString().padLeft(4, '0')}.${widget.fileType}',
                image:
                    'assets/sequence/${widget.folderName}/${name.toString().padLeft(4, '0')}.${widget.fileType}'),
          ),
          Container(
            width: double.infinity,
            child: Slider.adaptive(
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
