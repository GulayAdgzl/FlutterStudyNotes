import 'package:equatable/equatable.dart';

class UserManagemnt<T extends AdminUser> {
  //AdminUserden türemek zorunda
  //final AdminUser admin;
  final T admin;
//Clası sınırlandırmak istediğimizde sadece sınırlandırmak istediğizide bu özellikler olsun dersek:Generic
  UserManagemnt(this.admin);
  void sayNmae(GenericUser user) {
    print(user.name);
  }

  int calculateMoney(List<GenericUser> users) {
    int sum = 0;
    for (var item in users) {
      sum += item.money;
    }
    int initialValue = admin.role == 1 ? admin.money : 0;

    final sumMoney = users.map((e) => e.money).fold<int>(
        initialValue, (previousValue, element) => previousValue + element);
    final _money = users.fold<int>(initialValue,
        (previousValue, element) => previousValue + element.money);
    return sum;
  }

  Iterable<T>? showNames(List<GenericUser> users) {
    //Bunu sadece role 1 olanlar
    if (T is String) {
      final names = users.map((e) => e.name);
      return names.cast<T>();
    }

    //final names=users.map((e) => e.name).cast<T>();
    //return names;
    return null;
  }
}

class GenericUser extends Equatable {
  final String name;
  final String id;
  final int money;

  const GenericUser(this.name, this.id, this.money);

  //singleWhere için
  bool findUserName(String name) {
    return this.name == name;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}

class AdminUser extends GenericUser {
  final int role;

  AdminUser(String name, String id, int money, this.role)
      : super(name, id, money);
}
