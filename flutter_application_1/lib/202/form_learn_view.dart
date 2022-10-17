import 'package:flutter/material.dart';

class formLearnView extends StatefulWidget {
  const formLearnView({Key? key}) : super(key: key);

  @override
  State<formLearnView> createState() => _formLearnViewState();
}

class _formLearnViewState extends State<formLearnView> {
  //key kullanımı :bir widgete doğrudan erişim sağlar
  //GlobalKey formsttse özel durumları tutar
  GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Form(
            //key:Key(value),
            key: _key,
            //her zamann kullanılmasını istersk
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                TextFormField(
                  validator: FormFieldValidator().isNotEmpty,
                  /*(value) {
                    return (value?.isNotEmpty ?? false)
                        ? null
                        : 'Bu alan boş geçilemez';
                  },*/
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_key.currentState?.validate() ?? false) {
                        print('okey');
                      }
                    },
                    child: Text('Save'))
              ],
            )));
  }
}

class FormFieldValidator {
  String? isNotEmpty(String? data) {
    return (data?.isNotEmpty ?? false) ? null : ValidatorMessage._notEmpty;
  }
}

class ValidatorMessage {
  static const String _notEmpty = 'Boş Geçme';
}
