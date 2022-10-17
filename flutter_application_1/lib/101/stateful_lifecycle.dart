import 'package:flutter/material.dart';

class StatefulLifeCycleLeaarn extends StatefulWidget {
  //Müşteriden bir kere alacaksam buraya yazıyorum
  final String message;

  const StatefulLifeCycleLeaarn({Key? key, required this.message})
      : super(key: key);

  //const StatefulLifeCycleLeaarn({super.key, required this.message});

  @override
  State<StatefulLifeCycleLeaarn> createState() =>
      _StatefulLifeCycleLeaarnState();
}

class _StatefulLifeCycleLeaarnState extends State<StatefulLifeCycleLeaarn> {
  String _message = '';
  late final bool _isOdd;
  //3.lifecycle
  @override
  void didUpdateWidget(covariant StatefulLifeCycleLeaarn oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.message != widget.message) {
      _message = widget.message;
      _computeNmae();
      setState(() {});
    }
  }

  void dispose() {
    super.dispose();
    print('alo');
  }

  //2.lifecycle initstate den sonra çalışır
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _computeNmae();
  }

  //Mesaj tekse yanına tek yoksa çift
  @override
  void initState() {
    super.initState();
    _message = widget.message;
    _isOdd = widget.message.length.isOdd;
    _computeNmae;
  }

  void _computeNmae() {
    if (_isOdd) {
      _message += "Çift";
    } else {
      _message += "Tek";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_message)),
      body: _isOdd
          ? TextButton(onPressed: () {}, child: Text(_message))
          : ElevatedButton(onPressed: () {}, child: Text(_message)),
    );
  }
}
