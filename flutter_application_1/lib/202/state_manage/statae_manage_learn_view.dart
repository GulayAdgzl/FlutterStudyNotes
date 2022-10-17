import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/state_manage/state_learn_view_model.dart';
//import 'package:flutter_application_1/202/state_manage/state_learn_view_model.dart';

class stateManage extends StatefulWidget {
  const stateManage({Key? key}) : super(key: key);

  @override
  State<stateManage> createState() => _stateManageState();
}

class _stateManageState extends StateLearnViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          changeOpasity();
        },
      ),
      appBar: AppBar(
        backgroundColor: isOpasity ? Colors.red : Colors.green,
        shadowColor: visible ? Colors.yellow : Colors.blue,
      ),
    );
  }
}
