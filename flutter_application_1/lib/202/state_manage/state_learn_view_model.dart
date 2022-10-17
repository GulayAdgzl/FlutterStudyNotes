import 'package:flutter/cupertino.dart';
import 'package:flutter_full_learn/202/state_manage/statae_manage_learn_view.dart';
//import 'package:flutter_application_1/202/state_manage/statae_manage_learn_view.dart';

abstract class StateLearnViewModel extends State<stateManage> {
  bool visible = false;
  bool isOpasity = false;
  void changeVisible() {
    setState(() {
      visible = !visible;
    });
  }

  void changeOpasity() {
    setState(() {
      isOpasity = !isOpasity;
    });
  }

  late AnimationController controller;
  @override
  void initState() {
    super.initState();
  }
}
