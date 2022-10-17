import 'package:flutter/material.dart';

import 'animated_ımage.dart';

class FoodApp extends StatefulWidget {
  const FoodApp({Key? key}) : super(key: key);

  @override
  State<FoodApp> createState() => _FoodAppState();
}

class _FoodAppState extends State<FoodApp> with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: _MyFoodViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return DefaultTabController(
      length: _MyFoodViews.values.length,
      child: Scaffold(
        //backgroundColor: Colors.transparent,
        appBar: AppBar(),
        body: SizedBox(
          width: double.infinity,
          child: TabBarView(
            children: [
              Container(
                color: ColorsItems.BlackColor,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Padding(
                        padding: ProjectPadding.pageVertical20,
                        child: Expanded(
                          child: AnimatedImage(0),
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 100,
                        child: Padding(
                          padding: ProjectPadding.paddingall9,
                          child: _Text1(context),
                        ),
                      ),
                      SizedBox(height: 40),
                      Positioned(
                        left: 20,
                        child: _Text2(context),
                      ),
                      Positioned(
                        left: 20,
                        child: _Text3(context),
                      ),
                      Positioned(
                        left: 20,
                        child: _Text4(context),
                      ),
                    ],
                  ),
                ),
              ),
              //Yemeğin Tarifi

              SingleChildScrollView(
                child: Container(
                    color: Color.fromARGB(255, 202, 186, 186),
                    child: Column(
                      children: const [
                        Card(
                          child: Padding(
                            padding: ProjectPadding.paddingAll20,
                            child: ExpansionTile(
                              subtitle: Text(StringText.s1),
                              title: Text(StringText.title),
                              children: [
                                Text(StringText.h1),
                                Text(StringText.h2),
                                Text(StringText.h3),
                                Text(StringText.h4),
                                Text(StringText.h5),
                                Text(StringText.h6),
                                Text(StringText.h7),
                                Text(StringText.h8),
                                Text(StringText.h9),
                                Text(StringText.h10),
                                Text(StringText.h11),
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _tabController.animateTo(_MyFoodViews.Tatli1.index);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: _BottomNavi(),
      ),
    );
  }

  Text _Text4(BuildContext context) {
    return Text(StringText.t3,
        style: Theme.of(context)
            .textTheme
            .subtitle2
            ?.copyWith(color: Colors.grey));
  }

  Text _Text3(BuildContext context) {
    return Text(StringText.t2,
        style: Theme.of(context)
            .textTheme
            .subtitle2
            ?.copyWith(color: Colors.grey));
  }

  Text _Text2(BuildContext context) {
    return Text(
      StringText.t1,
      style:
          Theme.of(context).textTheme.subtitle2?.copyWith(color: Colors.grey),
    );
  }

  Text _Text1(BuildContext context) {
    return Text(
      StringText.welcomeTitle,
      style: Theme.of(context)
          .textTheme
          .headline4
          ?.copyWith(fontStyle: FontStyle.italic, color: Colors.grey),
    );
  }
}

class _BottomNavi extends StatelessWidget {
  const _BottomNavi({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BottomAppBar(
      notchMargin: 10,
      shape: CircularNotchedRectangle(),
      child: _MyTabView(),
    );
  }
}

class _MyTabView extends StatelessWidget {
  const _MyTabView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      // labelColor: Colors.black,
      padding: ProjectPadding.paddingZero,
      indicatorColor: ColorsItems.BlackColor,
      tabs: [Tab(icon: Icon(Icons.favorite)), Tab(icon: Icon(Icons.menu_book))],
    );
  }
}

enum _MyFoodViews { Tatli1, Tatli2 }

class StringText {
  static const welcomeTitle = "Components for Stone Kadayif Recipe";
  static const t1 = "2.5 glasses of water";
  static const t2 = "2 cups granulated sugar";
  static const t3 = "1/4 piece of lemon";
  static const s1 = "How you can Make Stone Kadayif Recipe?";
  static const title = " Stone Kadayif Recipe";
  static const h1 =
      "Since your syrup must be heat and your dessert must be scorching, first begin by making sherbet";
  static const h2 =
      "Add water and sugar to a pot, combine effectively and put the pot on the range. After it begins to boil, decrease the warmth and let it simmer on low warmth for 10 minutes.";
  static const h3 =
      "On the finish of 10 minutes, add the lemon juice and boil for one more 5 minutes and switch off the warmth. To ensure that the syrup to chill down, you’ll be able to put it within the fridge after it cools down a bit at room temperature.";
  static const h4 =
      "Add the warmed milk, water, sugar, salt and dry yeast to a deep bowl and blend. Then add the flour and beat for five minutes with the assistance of a mixer.";
  static const h5 =
      "It is vital that you’ve obtained a very homogeneous combination. Place a bag over the combination you might have ready and depart it to ferment for about half-hour in a heat place.";
  static const h6 =
      "When the dough rises and the eyes grow to be eyes, it signifies that the fermentation course of is full.";
  static const h7 =
      "Take a non-stick pan on the range and don’t put any oil in it. After heating the pan effectively on the range, take it into the pan one ladle at a time and prepare dinner solely the underside aspect.";
  static const h8 =
      " When there isn’t a wetness on the higher aspect, take your small spherical dough from the range and set it apart.";
  static const h9 =
      "After making ready all of the dough on this method, put walnuts on the a part of the dough that you just didn’t prepare dinner and shut the dough within the type of a half moon. Press down firmly on the sides in order that it adheres.";
  static const h10 =
      "Put loads of sunflower oil in a deep frying pan and warmth it effectively. After the oil is scorching, begin frying the kadaifs. Within the meantime, hold your syrup with you chilly.";
  static const h11 =
      "'Take the fried kadayifs from the oil and put them immediately into the chilly syrup. On this method, fry all of the kadayifs and put them in syrup. Kadayifs are able to be served after ready for about 10 minutes in sherbet. Serve with cream and pistachios on prime.'";
}

class ProjectPadding {
  static const pageVertical20 = EdgeInsets.symmetric(vertical: 20);
  static const paddingall9 = const EdgeInsets.all(9.0);
  static const paddingAll20 = EdgeInsets.all(20);
  static const paddingZero = EdgeInsets.zero;
}

class ColorsItems {
  static const Color BlackColor = Color.fromARGB(255, 4, 4, 4);
}
