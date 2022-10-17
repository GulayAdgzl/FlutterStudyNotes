import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/sevice/post_model.dart';

class ServicePostLearn extends StatefulWidget {
  const ServicePostLearn({Key? key}) : super(key: key);

  @override
  State<ServicePostLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServicePostLearn> {
  String? name;
  bool _isLoading = false;
  late final Dio _dio;
  final _baseUrl = 'https://jsonplaceholder.typicode.com';
  //datam olmayabilir ya da hiç gelmeyebilir o yüzden soru işareti koyduk

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();

//response çağırmak için
  @override
  void initState() {
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
    super.initState();
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> _addItemToService(PostModel postMode) async {
    _changeLoading();
    final response = await _dio.post('posts', data: postMode);
    if (response.statusCode == HttpStatus.created) {
      name = 'Basarili';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //servisten gelen ve sıralı data göstereceksek ListView kullan
      appBar: AppBar(
        title: Text(name ?? ''),
        actions: [
          _isLoading
              ? const CircularProgressIndicator.adaptive()
              : const SizedBox.shrink()
        ],
      ),
      body: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              labelText: 'Title',
            ),
          ),
          TextField(
            controller: _bodyController,
            decoration: InputDecoration(
              labelText: 'Body',
            ),
          ),
          TextField(
            controller: _userIdController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'UserId',
            ),
          ),
          TextButton(
              //çok önemli kod unutma isloading sırasında mı o değilse null ya da başka hiçbirşey yapma

              onPressed: _isLoading
                  ? null
                  : () {
                      if (_titleController.text.isNotEmpty &&
                          _bodyController.text.isNotEmpty &&
                          _userIdController.text.isNotEmpty) {
                        final model = PostModel(
                            body: _bodyController.text,
                            title: _titleController.text,
                            userId: int.tryParse(_userIdController.text));

                        _addItemToService(model);
                      }
                    },
              child: Text('sendd')),
        ],
      ),
    );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({
    Key? key,
    required PostModel model,
  })  : _model = model,
        super(key: key);

  final PostModel _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        title: Text(_model.title ?? ''),
        subtitle: Text(_model.body ?? ''),
      ),
    );
  }
}
