import 'package:flutter/material.dart';

import '../../feature/onboard/onboard_model.dart';

class OnBoardCard extends StatelessWidget {
  final OnBoardModel model;

  const OnBoardCard({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(model.title, style: Theme.of(context).textTheme.headline4),
        Text(model.description),
        Image.asset(model.imageWithPath)
      ],
    );
  }
}
