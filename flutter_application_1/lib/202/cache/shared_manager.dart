import 'package:flutter_full_learn/202/cache/shared_not_initalze.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SharedKeys { counter, users }

class ShareManager {
  SharedPreferences? preferences;
  SharedManager() {
    init();
  }

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  void _checkPrefences() {
    if (preferences == null) {
      throw SharedNotinitalzeException();
    }
  }

  Future<void> saveString(SharedKeys key, String value) async {
    _checkPrefences();
    await preferences?.setString(key.name, value);
  } //İşlemler bir bekleme old.için future çevirip bu işlemlerin zamanı old. söyleriz

  String? getString(SharedKeys key) {
    _checkPrefences();
    return preferences?.getString(key.name);
  } //String ? çünkü data olmayabilir

  Future<bool> removeItem(SharedKeys key) async {
    _checkPrefences();
    return (await preferences?.remove(key.name)) ?? false;
  }
//List için

  Future<void> saveStringItems(SharedKeys key, List<String> value) async {
    _checkPrefences();
    await preferences?.setStringList(key.name, value);
  }

  List<String>? getStrings(SharedKeys key) {
    _checkPrefences();
    return preferences?.getStringList(key.name);
  }

  //
}
