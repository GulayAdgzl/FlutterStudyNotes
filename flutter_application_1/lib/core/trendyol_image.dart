import 'package:flutter/material.dart';

class trendYolImage extends StatelessWidget {
  const trendYolImage({Key? key, this.height = 100}) : super(key: key);
  final imageTrend = 'assets/trend';
  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(imageTrend, height: height, fit: BoxFit.cover);
  }
}
