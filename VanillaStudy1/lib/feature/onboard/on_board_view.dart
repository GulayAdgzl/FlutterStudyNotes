import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_learn/feature/onboard/onboard_model.dart';
import 'package:flutter_full_learn/feature/onboard/tab_indicator.dart';
import 'package:flutter_full_learn/product/widgets/onBoard_card.dart';

import '../../product/padding/page_padding.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({Key? key}) : super(key: key);

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  //start-next stringleri
  final String _start = 'Start';
  final String _end = 'Next';
  final String _skipTile = 'Skip';
  //late final TabController _tabController;
  int _selectedIndex = 0;
  //Back butonu için
  bool get _isFirstPage => _selectedIndex == 0;

  bool get _isLastPage =>
      OnBoardModels.onBoardItems.length - 1 == _selectedIndex;
  /****
       * 
       */
  ValueNotifier<bool> isBackEnable = ValueNotifier(false);

  /* @override
  void initState() {
    super.initState();
    /*_tabController =
        TabController(length: OnBoardModels.onBoardItems.length, vsync: this);*/
  }*/

//Butona bastıkça resmin ve sayfanın ilerlemesi için
  void _incrementAndChange([int? value]) {
    //Eğer sayfa ilerlerken sonuncu sayfada yine butona basıp cache atarsa
    if (_isLastPage && value == null) {
      _changeBackEnable(true);
      //son sayfadan başa geri girmek için
      //start yapmasını istersek
//value yazmamın sebebi sayfadaki resmin değişmesi
      return;
    }
    _changeBackEnable(false);
    _IncrementSelectedPages(value);
    // _changeIndicator(_selectedIndex);
  }

  void _changeBackEnable(bool value) {
    if (value == isBackEnable.value) return;
    isBackEnable.value = value;
  }

  void _IncrementSelectedPages([int? value]) {
    setState(() {
      if (value != null) {
        _selectedIndex = value;
      } else {
        _selectedIndex++;
      }
    });
  }

  /* void _changeIndicator(int value) {
    _tabController.animateTo(value);
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          //AppBarın sağında bir şey varsa --action
          actions: [TextButton(onPressed: () {}, child: Text(_skipTile))],
          /*Back butonu için */ leading: _isFirstPage
              ? null
              : IconButton(
                  onPressed: () {}, icon: Icon(Icons.chevron_left_outlined)),
        ),
        body: Padding(
          padding: PagePadding.all(),
          child: Column(
            children: [
              //Sağa sola gidiyosa PageView
              Expanded(
                child: _pageViewItems(),
              ),

              Row(
                  //Aralarında çok boşluk olmasını istersen
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TabIndicator(selectedIndex: _selectedIndex),
                    /* TabPageSelector(
                      controller: _tabController,
                    ),*/
                    _nextButton()
                  ])
            ],
          ),
        ));
  }

  Widget _pageViewItems() {
    return PageView.builder(
        //resmin değişmesi
        onPageChanged: (value) {
          _incrementAndChange(value);
        },
        itemCount: OnBoardModels.onBoardItems.length,
        itemBuilder: (context, index) {
          return OnBoardCard(model: OnBoardModels.onBoardItems[index]);
          /*Column(
                      children: [
                        Text('Order you'),
                        Text('Now You'),
                        Image.asset('assets/image/ic_chef.png')
                      ],
                    );*/
        });
  }

  FloatingActionButton _nextButton() => FloatingActionButton(
      child: Text(_isLastPage ? _start : _end), //Butondaki tezti değiştirdiii
      onPressed: () {
        //Butona bastıkça
        _incrementAndChange();
      });
}
