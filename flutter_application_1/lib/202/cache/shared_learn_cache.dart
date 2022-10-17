import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/cache/shared_manager.dart';
import 'package:flutter_full_learn/202/cache/usercache/user_model.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SharedLearn extends StatefulWidget {
  const SharedLearn({Key? key}) : super(key: key);
//Basit widgetlerın varsa metot yapar
//komplex widget yapıp aşağı çıkart
  @override
  State<SharedLearn> createState() => _SharedLearnState();
}

class _SharedLearnState extends LoadingStatefull<SharedLearn> {
  int _currentValu = 0;
  late final ShareManager _manager;

  late final List<User> userItems;
  /* @override
  Future<void> initState() async {//future:initstate constrant gibi çalıştığı için future bekleyemez yani ana threaddeki işlemini yapar
                                  //o yzden buraya async verilmez

    
    super.initState();
    final prefs = await SharedPreferences.getInstance();
    final int? counter = prefs.getInt('counter');
  }*/

//2.yol func yap
  @override
  void initState() {
    super.initState();
    _manager = ShareManager();
    userItems = UserItems().users;
    _initialized();

    //sonra burda call edeceksin
    //getDeafultValues();
  }

  Future<void> _initialized() async {
    changLoading();
    await _manager.init();
    changLoading();
    getDeafultValues();
  }

  Future<void> getDeafultValues() async {
    /*
    final prefs = await SharedPreferences.getInstance();
    final int? counter = prefs.getInt('counter');*/
    // _onChangeValue(counter.toString());
    _onChangeValue(_manager.getString(SharedKeys.counter) ?? '');
  }

  void _onChangeValue(String value) {
    final _value = int.tryParse(value);
    if (_value != null) {
      setState(() {
        _currentValu = _value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              )
            : const SizedBox.shrink(),
      ], title: Text(_currentValu.toString())),
      //floatingbutton ile bağlayıp  datayı saklayacaz  bi daha girdiğinde son değeri görmek istersek
      floatingActionButton: Row(
        //kapladığı alan kadar alması için:
        mainAxisSize: MainAxisSize.min,
        children: [
          _saveValueButton(),
          _removeValueButton(),
        ],
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              _onChangeValue(value);
            },
          ),
          Expanded(child: _UserListView()),
        ],
      ),
    );
  }

  FloatingActionButton _saveValueButton() {
    return FloatingActionButton(
      child: const Icon(Icons.save),
      onPressed: (() async {
        changLoading();

        /* final prefs = await SharedPreferences.getInstance();
        await prefs.setInt('counter', _currentValu);*/
        await _manager.saveString(SharedKeys.counter, _currentValu.toString());
        changLoading();
      }),
    );
  }

  FloatingActionButton _removeValueButton() {
    return FloatingActionButton(
      child: const Icon(Icons.remove),
      onPressed: () async {
        changLoading();

        /* final prefs = await SharedPreferences.getInstance();
        await prefs.remove('counter');*/
        await _manager.removeItem(SharedKeys.counter);
        changLoading();
      },
    );
  }
}

class _UserListView extends StatelessWidget {
  _UserListView({
    Key? key,
  }) : super(key: key);

  final List<User> users = UserItems().users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //itemCount: 10,
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            title: Text(users[index].name ?? ''),
            subtitle: Text(users[index].description ?? ''),
            trailing: Text(users[index].url ?? '',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(decoration: TextDecoration.underline)),
          ),
        );
      },
    );
  }
}

abstract class LoadingStatefull<T extends StatefulWidget> extends State<T> {
  //
  bool isLoading = false;

  void changLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
/*
class User {
  final String name;
  final String description;
  final String url;

  User(this.name, this.description, this.url);
}*/

class UserItems {
  late final List<User> users;
  UserItems() {
    users = [
      User('g1', '10', 'g.dev'),
      User('g2', '20', 'g.dev'),
      User('g3', '30', 'g.dev'),
    ];
  }
}
