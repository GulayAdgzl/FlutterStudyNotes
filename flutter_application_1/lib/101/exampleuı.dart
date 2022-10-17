import 'package:flutter/material.dart';

class ExampleUi extends StatelessWidget {
  const ExampleUi({Key? key}) : super(key: key);
  final String title = 'Log in to your account';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(),
        body: Column(
          children: [
            Text(title,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: Colors.black)),
            Text('Connect people around the wolrd',
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    ?.copyWith(color: Colors.green[400])),
            SizedBox(
              height: 400,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(child: Image.asset('assets/1.png')),
                  //const Divider(),
                  Container(child: Image.asset('assets/2.png')),
                  Container(child: Image.asset('assets/3.png')),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {},
                child: Text('Login',
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        ?.copyWith(color: Colors.green[400])),
              ),
            ),
          ],
        ));
  }
}
