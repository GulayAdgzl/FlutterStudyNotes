import 'package:flutter/material.dart';

class ChexProject extends StatefulWidget {
  const ChexProject({Key? key}) : super(key: key);

  @override
  State<ChexProject> createState() => _ChexProjectState();
}

class _ChexProjectState extends State<ChexProject> {
  bool _isInnerScrool = false;

  void _updateScroll(bool value) {
    setState(() {
      _isInnerScrool = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: ((context, innerBoxIsScrolled) {
          _updateScroll(innerBoxIsScrolled);
          return [
            _SliverHeader(context, innerBoxIsScrolled),
          ];
        }),
        body: Scaffold(body: _listView()));
  }

  SliverAppBar _SliverHeader(BuildContext context, bool innerBoxIsScrolled) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height * 0.2,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(innerBoxIsScrolled ? 'Chex' : 'Hello'),
      ),
    );
  }

  ListView _listView() {
    return ListView.builder(itemBuilder: (context, index) {
      return Card(
        child: Text('$index'),
      );
    });
  }
}
