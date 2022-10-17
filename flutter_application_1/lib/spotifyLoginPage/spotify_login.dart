import 'package:flutter/material.dart';

class SpotifyLogin extends StatefulWidget {
  const SpotifyLogin({Key? key}) : super(key: key);

  @override
  State<SpotifyLogin> createState() => _SpotifyLoginState();
}

class _SpotifyLoginState extends State<SpotifyLogin>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController =
        TabController(length: _SpotifyTabViews.values.length, vsync: this);
    //this yazdı  çünkü yukarıya with yaptığı için
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _SpotifyTabViews.values.length,
      child: Scaffold(
        backgroundColor: ColorsItems.black,
        appBar: AppBar(
          backgroundColor: ColorsItems.black,
          bottom: TabBar(
            //controller: _tabController,
            tabs: _SpotifyTabViews.values
                .map((e) => Tab(text: '${e.name}'))
                .toList(),
          ),
        ),
        body: _tabbarSpotifyView(/*tabController: _tabController*/),
      ),
    );
  }

  TabBar _MyTabbar() {
    return TabBar(
      padding: EdgeInsets.zero,
      //controller: _tabController,
      tabs: _SpotifyTabViews.values.map((e) => Tab(text: '${e.name}')).toList(),
      indicatorColor: Color.fromARGB(255, 25, 202, 31),
    );
  }
}

class ImageItems {
  final String spotify = "assets/spotify.png";
}

class ProjectPadding {
  static const pagePaddingRight = EdgeInsets.only(right: 10);
}

class ColorsItems {
  static const Color black = Color.fromARGB(255, 34, 33, 33);
}

class _tabbarSpotifyView extends StatelessWidget {
  const _tabbarSpotifyView({
    Key? key,

    // required TabController tabController,
  }); // : _tabController = tabController,

  //final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
        //Fiziksel olarak yana kaymasını engellemek istersek
        physics: const NeverScrollableScrollPhysics(),
        //controller: _tabController,
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

// ignore: constant_identifier_names
enum _SpotifyTabViews { SIGNIN, SIGNUP }
