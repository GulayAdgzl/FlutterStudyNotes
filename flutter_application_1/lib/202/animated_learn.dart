import 'package:flutter/material.dart';

const kZero = 0;

class AnimatedLearn extends StatefulWidget {
  const AnimatedLearn({Key? key}) : super(key: key);

  @override
  State<AnimatedLearn> createState() => _AnimatedLearnState();
}

class _AnimatedLearnState extends State<AnimatedLearn>
    with TickerProviderStateMixin {
  bool _visible = false;
  bool _isOpasity = false;
  void _changeVisible() {
    setState(() {
      _visible = !_visible;
    });
  }

  void _changeOpasity() {
    setState(() {
      _isOpasity = !_isOpasity;
    });
  }

  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: _DurationItems.durationLow);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: _PlaceHolderWidget(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _changeVisible();
            controller.animateTo(_visible ? 1 : 0);
          },
        ),
        //Placeholderi göstermek istemiyorsan body de null alablilr old.için
        //body: _visible ? Placeholder():null,
        //Text('data', style: context.textTheme().subtitle1),

        //Aıl önemli kısım
        //2 widget arasında değişiklik yapar :AnimatedCrossFade
        // body:  _PlaceHolderWidget(),

        body: Column(
          children: [
            ListTile(
              title: AnimatedOpacity(
                  duration: _DurationItems.durationLow,
                  opacity: _isOpasity ? 1 : 0,
                  child: const Text('data')),
              trailing: IconButton(
                onPressed: () {
                  _changeOpasity();
                },
                icon: const Icon(Icons.abc_sharp),
              ),
            ),
            AnimatedDefaultTextStyle(
                child: Text('Gülay'),
                style: (_visible
                        ? context.textTheme().headline1
                        : context.textTheme().subtitle1) ??
                    TextStyle(),
                duration: _DurationItems.durationLow),
            AnimatedIcon(icon: AnimatedIcons.menu_close, progress: controller),
            AnimatedContainer(
              duration: _DurationItems.durationLow,
              height: _visible
                  ? 0
                  : MediaQuery.of(context).size.width *
                      0.2, //yüzde 20 si olamsını istersek
              width: MediaQuery.of(context).size.height * 0.2,
              color: Colors.blue,
              margin: const EdgeInsets.all(5),
            ),
            Expanded(
                child: Stack(
              children: const [
                AnimatedPositioned(
                    top: 10,
                    curve: Curves.elasticInOut,
                    child: Text('www'),
                    duration: _DurationItems.durationLow),
              ],
            ))

            /* Expanded(
                child: AnimatedList(itemBuilder: (context, index, animation) {
              return const Text('aaaaaa');


            },
                ),*/
          ],
        ));
  }

  AnimatedCrossFade _PlaceHolderWidget() {
    return AnimatedCrossFade(
      firstChild: Placeholder(),
      secondChild: const SizedBox.shrink(),
      //duration: Duration(seconds: 1),
      duration: _DurationItems.durationLow,
      crossFadeState:
          _visible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }
}

extension BuildContextExtension on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}

class _DurationItems {
  static const durationLow = Duration(seconds: 1);
}
