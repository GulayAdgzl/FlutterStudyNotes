import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SharedContext extends StatefulWidget {
  const SharedContext({Key? key}) : super(key: key);

  @override
  State<SharedContext> createState() => _SharedContextState();
}

enum _SecureKeys { token }

class _SharedContextState extends State<SharedContext> {
  final _storage = const FlutterSecureStorage();
  String _title = '';
  void saveItems(String data) {
    setState(() {
      _title = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getSecureItems();
  }

  Future<void> getSecureItems() async {
    _title = await _storage.read(key: _SecureKeys.token.name) ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            await _storage.write(key: _SecureKeys.token.name, value: _title);
          },
          label: const Text('save')),
      body: TextField(
        onChanged: saveItems,
        minLines: 3,
        maxLines: 4,
      ),
    );
  }
}
