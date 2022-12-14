import 'package:flutter/material.dart';

import 'feature/onboard/on_board_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'glyadgzl',
      theme: ThemeData.light().copyWith(
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData(backgroundColor: Colors.blue),
      ),
      home: OnBoardView(),
    );
  }
}
