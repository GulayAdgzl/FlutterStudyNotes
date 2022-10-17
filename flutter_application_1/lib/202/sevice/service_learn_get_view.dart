import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/sevice/post_model.dart';
import 'package:flutter_full_learn/202/sevice/post_service.dart';

import 'comment_learn_view.dart';

class ServiceLearn extends StatefulWidget {
  const ServiceLearn({Key? key}) : super(key: key);

  @override
  State<ServiceLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServiceLearn> {
  String? name;
  bool _isLoading = false;
  late final Dio _dio;
  final _baseUrl = 'https://jsonplaceholder.typicode.com';

  //datam olmayabilir ya da hiç gelmeyebilir o yüzden soru işareti koyduk
  List<PostModel>? _items;
//response çağırmak için

//Dioları post servisdekilerle entegreyi etmek için
//Test etmeye müsait kod yazmaya yol açıyor
  late final IPostService _postService;
  @override
  void initState() {
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
    super.initState();
    name = 'sss';

    fetchPostItemsAdvance();
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  //request atacağım ve datalarımı çekeceğim
  Future<void> fetchPostItems() async {
    _changeLoading();
    final response =
        await Dio().get('https://jsonplaceholder.typicode.com/posts');
    //bu kodu bekle ve bu koddan sonra buraya geçme demek

    if (response.statusCode == HttpStatus.ok) {
      final _datas = response.data;

      if (_datas is List) {
        setState(() {
          //map:yeni bir obje üretmek
          //bu listeyi yeni bir liste yap
          _items = _datas.map((e) => PostModel.fromJson(e)).toList();
        });
      }
    }
    _changeLoading();
  }

  Future<void> fetchPostItemsAdvance() async {
    _changeLoading();
    _items = await _postService.fetchPostItemsAdvance();
    /*await _dio.get('posts');
    //bu kodu bekle ve bu koddan sonra buraya geçme demek

    if (response.statusCode == HttpStatus.ok) {
      final _datas = response.data;

      if (_datas is List) {
        setState(() {
          //map:yeni bir obje üretmek
          //bu listeyi yeni bir liste yap
          _items = _datas.map((e) => PostModel.fromJson(e)).toList();
        });
      }
    }*/
    _changeLoading();
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
      body: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10),
          itemCount: _items?.length ?? 0,
          itemBuilder: (context, index) {
            return _PostCard(model: _items![index]);
          }),
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
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CommnetLearnView(postId: _model.id)));
        },
        title: Text(_model.title ?? ''),
        subtitle: Text(_model.body ?? ''),
      ),
    );
  }
}
