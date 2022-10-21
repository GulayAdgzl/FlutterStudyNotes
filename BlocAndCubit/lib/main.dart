import 'package:flutter/material.dart';

import '404/Bloc/feature/login/view/login_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'glyadgzl',
      debugShowCheckedModeBanner: false,
      //-*/theme: LighTheme().theme,
      //theme: context.watch<ThemeNotifer>().currentTheme,
      //routes: NavigatorRouters().items,

      home: LoginView(),
    );
  }
}
