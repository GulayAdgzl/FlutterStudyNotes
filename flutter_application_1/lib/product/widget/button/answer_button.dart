import 'dart:math';

import 'package:flutter/material.dart';

class AnswerButton extends StatefulWidget {
  AnswerButton({Key? key, this.onNumber}) : super(key: key);

  final bool Function(int number)? onNumber;

  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  Color? _backgroundColor;
  @override
  Widget build(BuildContext context) {
    //Bana bir sayı dön random bu sayı kontrol edip sana bir cevap verecem
    //bu cevaba göre butonun rengini günceller
    //eğer doğru ise yeşil yanlış ise kırmızı
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary:_backgroundColor),
        onPressed: () {
          final result = Random().nextInt(10);
          final response = widget.onNumber?.call(result) ?? false;
          setState(() {
            _backgroundColor = response ? Colors.green : Colors.red;
          });
        },
        child: Text('aaa'));
  }
}
