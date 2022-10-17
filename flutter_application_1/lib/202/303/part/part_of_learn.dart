import 'package:flutter/material.dart';
part './part_appBar.dart';

class PartofLeran extends StatefulWidget {
  const PartofLeran({Key? key}) : super(key: key);

  @override
  State<PartofLeran> createState() => _PartofLeranState();
}

class _PartofLeranState extends State<PartofLeran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _PartofAppBar(),
    );
  }
}
