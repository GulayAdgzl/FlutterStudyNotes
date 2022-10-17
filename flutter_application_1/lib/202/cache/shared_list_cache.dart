import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/cache/shared_learn_cache.dart';
import 'package:flutter_full_learn/202/cache/usercache/user_cache_manager.dart';
import 'package:flutter_full_learn/202/cache/usercache/user_model.dart';

import 'shared_manager.dart';

class _SharedListCacheState extends StatefulWidget {
  @override
  _SharedListCacheStateState createState() => _SharedListCacheStateState();
}

class _SharedListCacheStateState
    extends LoadingStatefull<_SharedListCacheState> {
  late final UserCacheManager userCacheManager;
  List<User> _users = [];

  @override
  void initState() {
    super.initState();
    initilazedAndSave();
  }

  Future<void> initilazedAndSave() async {
    changLoading();
    final ShareManager manager = ShareManager();
    await manager.init().whenComplete(() => () {
          userCacheManager = UserCacheManager(manager);
          _users = userCacheManager.getItems() ?? [];
        });
    changLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: isLoading
            ? CircularProgressIndicator(
                color: Theme.of(context).scaffoldBackgroundColor)
            : null,
        actions: isLoading
            ? null
            : [
                IconButton(
                    onPressed: () async {
                      changLoading();
                      await userCacheManager.saveItems(_users);
                      changLoading();
                    },
                    icon: const Icon(Icons.download_for_offline_outlined)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.remove_circle_outline)),
              ],
      ),
      body: _UserListView(users: _users),
    );
  }
}

class _UserListView extends StatelessWidget {
  const _UserListView({Key? key, required this.users}) : super(key: key);

  final List<User> users;

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
