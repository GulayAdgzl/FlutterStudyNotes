import 'package:flutter/material.dart';

import 'image_learn.dart';

//import 'icon_learn.dart';

class PageViewLearn extends StatefulWidget {
  const PageViewLearn({Key? key}) : super(key: key);

  @override
  State<PageViewLearn> createState() => _PageViewLearnState();
}

class _PageViewLearnState extends State<PageViewLearn> {
  final _pageController = PageController(viewportFraction: 0.7);
  int _currentPageIndex = 0;
  void _updatePageIndex(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        // mainAxisSize: MainAxisSize.min,

        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(_currentPageIndex.toString()),
          ),
          const Spacer(),
          FloatingActionButton(
            onPressed: () {
              _pageController.nextPage(
                  duration: _DurationUtility._durationLow,
                  curve: Curves.slowMiddle);
              child:
              const Icon(Icons.chevron_right);
            },
          ),
          FloatingActionButton(
            onPressed: () {
              _pageController.previousPage(
                  duration: _DurationUtility._durationLow,
                  curve: Curves.slowMiddle);
              child:
              const Icon(Icons.chevron_left);
            },
          ),
        ],
      ),
      appBar: AppBar(),
      body: PageView(
        padEnds: false,
        onPageChanged: _updatePageIndex, //(int index){},
        //Ön izleme yapar
        controller: _pageController,
        children: const [
          ImageLaern(),
          //IconLearnView(),
        ],
      ),
    );
  }
}

class _DurationUtility {
  static const _durationLow = const Duration(seconds: 1);
}
