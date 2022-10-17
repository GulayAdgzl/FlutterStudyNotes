import 'package:flutter/material.dart';

class ExamplePic extends StatelessWidget {
  const ExamplePic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            SizedBox(
              height: 357,
              width: 398,
              child: Image.asset(ImageItems().onepic, fit: BoxFit.cover),
            ),
          ],
        ));
  }
}

class ImageItems {
  final String onepic = "assets/1.png";
}
