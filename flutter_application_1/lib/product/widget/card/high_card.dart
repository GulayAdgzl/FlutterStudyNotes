import 'package:flutter/material.dart';

class HighCard extends StatelessWidget {
  final List<String> items;

  const HighCard({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(items.join(','), style: Theme.of(context).textTheme.headline2);
  }
}
