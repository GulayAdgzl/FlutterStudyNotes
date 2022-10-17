import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:flutter_full_learn/202/303/generic_learn.dart';
import 'package:flutter_full_learn/product/widget/card/high_card.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  test('List best of', () {
    List<GenericUser> users = [
      GenericUser('a', '11', 2),
      GenericUser('a', '11', 2),
      GenericUser('a', '11', 2),
    ];

    List<HighCard> highCard = users.map((e) {
      return HighCard(items: e.name.split('').toList());
    }).toList();

    //Ben sadece tek bir veri almak isterse:singleWhere
    //users.singleWhere(((element) => element.name == 'a'));
    try {
      //hangi demesin diye try-catch e attık
      //final response= users.singleWhere(((element) => element.findUserName('a')));
      //Listenin içinde olmayanı dönsün diye yazmışızı ama crash değil de null dönmesini istersek

      final response =
          users.singleWhere((element) => element.findUserName('x'), orElse: () {
        return GenericUser('a', 'd', 11);
      });
      print(response);
    } catch (e) {
      print(e);
    }

    //money si 50 olanı listelesin
    users.where((element) => element.money > 50);
    //alt alta gelsin
    log('${users.where((element) => element.money > 50)}');
    //birden fazla liste ekleme
    users.addAll([GenericUser('a', 'e', 33)]);
    //bu listenin en sonundaki itemin id sini 5 olanı bana getir
    users.lastWhere((element) => element.id == 5);
    //almak için,
    users.take(5);
    //remove nin çalışması için generic_user.dart a equtable ekledi
    users.remove(GenericUser('a', 'd', 11));
    //belli index i siler
    users.removeAt(1);
    users.removeWhere((element) => element.id == 11);
    //index i bulmak için equtable kullandıysan direk yaz
    users.indexOf(GenericUser('a', 'd', 11));
    final result = users.indexWhere((element) => element.id == 11);
    if (result >= 0) {
      users[result] = GenericUser('a', 'd', 11);
    }

    //entegre etme-listeyi büyütme
    users.expand((element) => [GenericUser('a', 'd', 11)]);
  });
  //2.yol
  test('List best of with collection ', () {
    List<GenericUser> users = [
      GenericUser('a', '11', 2),
      GenericUser('a', '11', 2),
      GenericUser('a', '11', 2),
    ];

    /*List<HighCard> highCard = users.map((e) {
      return HighCard(items: e.name.split('').toList());
    }).toList();*/

    //Ben sadece tek bir veri almak isterse:singleWhere
    //users.singleWhere(((element) => element.name == 'a'));

    //hangi demesin diye try-catch e attık
    //final response= users.singleWhere(((element) => element.findUserName('a')));
    //Listenin içinde olmayanı dönsün diye yazmışızı ama crash değil de null dönmesini istersek

    final response = users.singleWhereOrNull(
      (element) => element.findUserName('e'),
    );
    print(response);
    //bu listenin en sonundaki itemin id sini 5 olanı getiremezse
    users.lastWhereOrNull((element) => element.id == 5);

    //**************** */
    users.forEachIndexed((index, element) {});
    //rastgele değer iste
    users.sample(1);
    //equtable yazmadıysan
    users.contains(GenericUser('a', 'd', 11));
    //kontrol etmek istersend
    users.any((element) => element.money > 5);
  });
}
    //
  

//Map in amacı yeni bir model oluşturmak