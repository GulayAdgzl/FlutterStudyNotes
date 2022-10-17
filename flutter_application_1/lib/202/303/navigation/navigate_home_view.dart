import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/product/navigator/navigator_routers.dart';

class NavigateHomeView extends StatefulWidget {
  const NavigateHomeView({Key? key}) : super(key: key);

  @override
  State<NavigateHomeView> createState() => _NavigateHomeViewState();
}

class _NavigateHomeViewState extends State<NavigateHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.abc_rounded),
          onPressed: () {
            Navigator.of(context).pushNamed(NavigatorRouter.detail.withPraf);
            //işlem yapıp sağa gitmek istiyor
          }),
      appBar: AppBar(title: Text(toString())),
    );
  }
}
