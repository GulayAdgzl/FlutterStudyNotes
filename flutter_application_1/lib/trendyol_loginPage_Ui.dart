import 'package:flutter/material.dart';

class TrendyolLogin extends StatefulWidget {
  const TrendyolLogin({Key? key}) : super(key: key);

  @override
  State<TrendyolLogin> createState() => _TrendyolLoginState();
}

class _TrendyolLoginState extends State<TrendyolLogin> {
  FocusNode focusNoTextFieldOne = FocusNode();
  FocusNode focusNoTextFieldTwo = FocusNode();
  final _text = TextEditingController();
  final bool _validate = false;

  final key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.orange[800]),
      body: Column(children: [
        Expanded(
          flex: 5,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                bottom: 50,
                child: Container(
                  color: Colors.orange[800],
                  child: Image.asset(ImageItems().trend),
                ),
              ),
              Positioned(
                height: 150,
                bottom: 0,
                width: 400,
                child: Card(
                  //color: Colors.red,
                  //shape: RoundedRectangleBorder(),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 10,
                  child: TextField(
                    //maxLength: 20,

                    keyboardType: TextInputType.emailAddress,
                    autofocus: true,
                    autofillHints: const [AutofillHints.email],

                    //inputFormatters: [TextProjectInputFormatter()._formatter],
                    //focusNode:focusNoTextFieldOne,
                    textInputAction: TextInputAction.next,

                    decoration: InputDecoration(
                      //prefixIcon: Icon(Icons.mail),
                      // ignore: unnecessary_const
                      //contentPadding:
                      //EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      //labelText: 'Mail',
                      hintText: 'E-posta',

                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(flex: 5, child: Container(color: Colors.white)),
      ]),
    );
  }
}

//TextFormField(focusNode:focusNoTextFieldTwo)

// Expanded(flex: 5, child: Container(color: Colors.white)),

//TextFormField(focusNode:focusNoTextFieldTwo)

//Expanded(flex: 5, child: Container(color: Colors.white)),

/*Expanded(
            flex: 5,
            child: Container(color: Colors.white),
*/

/* 
                  const Positioned(
                    height: 100,
                    bottom: 0,
                    width: 300,
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(),
                    ),
                  ),
                  */

/*
             Container(
              color: Colors.orange[900],
              child: Image.asset(ImageItems().trend),
             
              )
              */

//PngImage(name: ImageItems().trend),
//Image.asset(ImageItems().trend, fit: BoxFit.cover),

class PaddingItems {
  final EdgeInsets horizontalPadding =
      const EdgeInsets.symmetric(horizontal: 20);
  final EdgeInsets verticalPadding = const EdgeInsets.symmetric(vertical: 20);
  final EdgeInsets LeftPadding = const EdgeInsets.only(left: 30);
}

class ImageItems {
  final String trend = "assets/trendyol.png";
}

class PngImage extends StatelessWidget {
  const PngImage({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Image.asset(_trend, fit: BoxFit.cover);
  }

  String get _trend => 'assets/$name.png';
}

/*
class TextProjectInputFormatter {
  final _formatter = TextInputFormatter.withFunction((oldValue, newValue) {
    if (newValue.text == 'a') {
      return oldValue;
    }
    return oldValue;
  });
}
*/
class ProjectMargin {
  static const cardMargin = EdgeInsets.all(10);
  static final roundedRectangleBorder =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(30));
}
