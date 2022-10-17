import 'package:flutter/material.dart';

class ThemeLearnView extends StatelessWidget {
  const ThemeLearnView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CheckboxListTile(
              value: true, onChanged: (val) {}, title: const Text('select'))
        ],
      ),
    );
  }
}
