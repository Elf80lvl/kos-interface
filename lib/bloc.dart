// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:kos_interface/content/content1.dart';
// import 'package:kos_interface/content/content2.dart';

// enum ContentChange { Content1, Content2 }

// class ContentBloc {
//   late Widget currentContent;
//   final _stateStreamController = StreamController<Widget>();

//   StreamSink<Widget> get contentSink => _stateStreamController.sink;
//   Stream<Widget> get contentStream => _stateStreamController.stream;

//   final _eventStreamController = StreamController<ContentChange>();
//   StreamSink<ContentChange> get eventSink => _eventStreamController.sink;
//   Stream<ContentChange> get eventStream => _eventStreamController.stream;

//   ContentBloc() {
//     currentContent = Content1();
//     eventStream.listen((event) {
//       if (event == ContentChange.Content1) {
//         currentContent = Content1();
//       } else if (event == ContentChange.Content2) {
//         currentContent = Content2();
//       }

//       contentSink.add(currentContent);
//     });
//   }
// }
