import 'package:flutter/material.dart';

class TabLearn extends StatefulWidget {
  const TabLearn({Key? key}) : super(key: key);

  @override
  State<TabLearn> createState() => _TabLearnState();
}

class _TabLearnState extends State<TabLearn> with TickerProviderStateMixin {
  //Başka sayfaya geçişini kontrol etmek istersek
  late final TabController _tabController;
  final double _notchedValur = 10;
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: _MyTabViews.values.length, vsync: this);
    //this yazdı  çünkü yukarıya with yaptığı için
  }

  @override
  Widget build(BuildContext context) {
    //Scaffold kullanılmıyor onun yerine DefaultTabController kullanılır
    return DefaultTabController(
        //lengt e elle 2 yazmak yerine  enum yazarak yazdık
        //length: 2,
        length: _MyTabViews.values.length,
        child: Scaffold(
          //notchMargin kısımının arka plan rengini alması için
          extendBody: true,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              //_tabController.animateTo(0);
              _tabController.animateTo(_MyTabViews.home.index);
            },
          ),
          //ortaya button
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,

          backgroundColor: Colors.black,
          bottomNavigationBar: BottomAppBar(

              //içeriye gömerek
              //notchMargin: 10,
              notchMargin: _notchedValur,
              //bunu da main theme dan ver
              //shape: CircularNotchedRectangle(),
              child: _MyTabView()),

//Eğer aşagıda göstermek istersek bottomNavigationBar

          //ğer yukarıda yapmak istersek appbar ile
          /* appBar: AppBar(
              backgroundColor: Colors.black,
              bottom: TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(text: 'Page 1'),
                  Tab(text: 'Page 2'),
                ],
              )),*/
          body: _tabbarView(tabController: _tabController),
        ));
  }

  TabBar _MyTabView() {
    return TabBar(
      //Ama bunları buraya değil de main kısmında theme data altına yaz ve default olarak gelsin
      /*
              //labelleri renklendirilmesi
              labelColor: Colors.red,
              //selected olmayanı yeşil yapmak
              unselectedLabelColor: Colors.green,
              //icon dgeldiğinde size sı sığmazsa istersek
              */
      padding: EdgeInsets.zero,
      onTap: (int index) {},

      //Tabin renklendirilmesi
      indicatorColor: Colors.red,
      //Sıkıştırark yan yana gelmesini sağlama
      //isScrollable: true,
      controller: _tabController,
      tabs: _MyTabViews.values.map((e) => Tab(text: '${e.name}')).toList(),

      /*[
                Tab(text: 'Page 1'),
                Tab(text: 'Page 2'),
              ],*/
    );
  }
}

class _tabbarView extends StatelessWidget {
  const _tabbarView({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
        //Fiziksel olarak yana kaymasını engellemek istersek
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          Container(
            color: Colors.red,
          ),
          Container(color: Colors.green),
          Container(
            color: Colors.yellow,
          ),
          Container(
            color: Colors.blue,
          ),
        ]);
  }
}

//length için yazdık
enum _MyTabViews { home, settings, favori, profile }

//_MyTabViews e güç kazandırmak için extension yazdık
extension _MyTabViewsExtension on _MyTabViews {}
