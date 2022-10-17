import 'dart:convert';

import 'package:flutter_full_learn/202/cache/usercache/user_model.dart';

import '../shared_learn_cache.dart';
import '../shared_manager.dart';

class UserCacheManager {
  final ShareManager sharedMnager;

  UserCacheManager(this.sharedMnager);

  Future<void> saveItems(List<User> items) async {
    final _items =
        items.map((element) => jsonEncode(element.toJson())).toList();
    await sharedMnager.saveStringItems(SharedKeys.users, _items);
  }

  List<User>? getItems() {
    final itemString = sharedMnager.getStrings(SharedKeys.users);
    if (itemString?.isNotEmpty ?? false) {
      return itemString!.map((element) {
        final json = jsonDecode(element);
        if (json is Map<String, dynamic>) {
          return User.fromJson(json);
        }
        return User('', '', '');
      }).toList();
    }
  }
}
