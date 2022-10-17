import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/image_learn.dart';
import 'package:flutter_full_learn/product/constant/project_items.dart';

import 'package:flutter_full_learn/product/global/resource_context.dart';
import 'package:flutter_full_learn/product/global/theme_notifider.dart';
import 'package:provider/provider.dart';

import '101/card_learn.dart';
import '202/303/lottie_learn.dart';
import '202/303/navigation/navigate_home_detail.dart';
import '202/303/navigation/navigate_home_view.dart';
import '202/bottomSheet.dart';
import '202/product/navigator/navigator_routers.dart';
import 'SliverExample/sliver_exa.dart';

//import '101/pageView_learn.dart';
//import '101/stateful_lifecycle.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider(create: (_) => ResourceContext()),
      ChangeNotifierProvider<ThemeNotifier>(
          create: (context) => ThemeNotifier()),
    ],
    builder: (context, child) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      title: ProjectItems.projectName,
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeNotifier>().currentTheme,
      //FoodTheme().theme,

      /* ThemeData().copyWith(
        //TabBar Theme Belirleme
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.white,
          //unselectedLabelColor: Color.fromARGB(255, 63, 206, 68),
          indicatorSize: TabBarIndicatorSize.label,
        ),
        bottomAppBarTheme: const BottomAppBarTheme(
          shape: CircularNotchedRectangle(),
        ),

        //primarySwatch: Colors.orange[900],
        progressIndicatorTheme:
            const ProgressIndicatorThemeData(color: Colors.white),
        listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.zero),
        cardTheme: CardTheme(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        //errorColor: ColorsItems.sulu,
        /*
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
            iconColor: Colors.red,
            labelStyle: TextStyle(color: Colors.lime),
            border: OutlineInputBorder(),
            floatingLabelStyle: TextStyle(
                color: Colors.red, fontSize: 25, fontWeight: FontWeight.w500),
          ),*/

        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),*/

      //Navigation package
      routes: NavigatorRouters().items,

      /*{
        "/": (context) => LottieLearn(),
        "/home": (context) => NavigateHomeView(),
        "/homeDetail": (context) => NavigateHomeDetailView(),
      },*/

      //home: const LottieLearn(),
    );
  }
}
