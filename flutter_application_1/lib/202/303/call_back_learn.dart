import 'package:flutter/material.dart';

import '../../product/widget/button/answer_button.dart';
import '../../product/widget/button/loading_button.dart';
import '../../product/widget/callback_dropdowm.dart';

class CallBack extends StatefulWidget {
  const CallBack({Key? key}) : super(key: key);

  @override
  State<CallBack> createState() => _CallBackState();
}

class _CallBackState extends State<CallBack> {
  CallbackUser? _user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CallBackDropDown(onUserSelected: (CallbackUser user) {
            print(user);
          }),
          AnswerButton(
            onNumber: (number) {
              return number % 3 == 1;
            },
          ),
          LoadingButton(
              title: 'Save',
              callback: () async {
                await Future.delayed(const Duration(seconds: 1));
              })
        ],
      ),
    );
  }
}

class CallbackUser {
  final String name;
  final int id;

  CallbackUser(this.name, this.id);
//TODO DummyRemove it
  static List<CallbackUser> dummyUser() {
    return [
      CallbackUser('ss', 3),
      CallbackUser('ss', 4),
      CallbackUser('ss', 5),
    ];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CallbackUser && other.name == name && other.id == id;
  }
}
