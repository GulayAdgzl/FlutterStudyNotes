import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'language/language_items.dart';

class StatefullLearn extends StatefulWidget {
  //Notes:2 tane class karşımıza geldi
  //1.kısım değişmez bir componentdir.sadece dışardan parametre alır.Stateless gibi çalışır
  //2.ksıım ise hayatı belirleyen kısımdır.
  //
  //statelesswidget in üzerine gelip tıklayınca convert to statefulwidget yaptı
  //counter ile alakalı bir işlem geliştirmek istiyorsam body e bir text yazarız 1 yazdık

  const StatefullLearn({Key? key}) : super(key: key);

  @override
  State<StatefullLearn> createState() => _StatefullLearnState();
}

class _StatefullLearnState extends State<StatefullLearn> {
  // int countValue = 0; private dönüştür
  //aynı metodu niye 2 kez yazıyorum
  //
  int _countValue = 0;
  //int _counterCustom = 0;

  void _updateCounter(bool isIncrement) {
    if (isIncrement) {
      _countValue = _countValue + 1;
    } else {
      _countValue = _countValue - 1;
    }
    setState(() {});
  }

  /*
  void incrementValue() {
    setState(() {
      _countValue = _countValue + 1;
    });
  }

  void deincrementValue() {
    setState(() {
      _countValue = _countValue - 1;
    });
  }
  */

  @override
  Widget build(BuildContext context) {
    var LanguageItems;
    return Scaffold(
      appBar: AppBar(title: Text(LanguageItems.welcomeTitle)),
      //floatingActionButton row la sardı .widget olduğu için ve 2 tane buton old.için
      floatingActionButton: Row(
        //aynı oranda sıkıştırsın diye
        mainAxisSize: MainAxisSize.min,
        //FloatingActionButton padding attı soluna
        //iç içe yazmamk için  method olarak yaz paddingleri
        children: [
          _deincrementButton(),
          _incrementButton(),
        ],
      ),
      body: Column(
        children: [
          Center(
              child: Text(_countValue.toString(),
                  style: Theme.of(context).textTheme.headline5)),
          const Placeholder(),
          /*
          ElevatedButton(onPressed: () {
            setState(() {++_counterCustom;})
          }, child:  Text('Merhaba $_counterCustom')),*/
        ],
      ),
    );
  }

  Padding _incrementButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: FloatingActionButton(
        onPressed: () {
          _updateCounter(true);
        },
        child: Icon(Icons.remove),
      ),
    );
  }

  Padding _deincrementButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: FloatingActionButton(
        onPressed: () {
          _updateCounter(false);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
