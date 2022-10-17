import 'package:flutter/material.dart';

class CounterButton extends StatefulWidget {
  const CounterButton({Key? key}) : super(key: key);

  @override
  State<CounterButton> createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  int _counterCustom = 0;
  final String _welcomeTitle = LanguagaeItems.welcomeTitle;
  void _updateCounter() {
    setState(() {
      ++_counterCustom;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: _updateCounter, child: Text('Merhaba $_counterCustom'));
  }
}

class LanguagaeItems {
  static const welcomeTitle = "Merhaba";
}
