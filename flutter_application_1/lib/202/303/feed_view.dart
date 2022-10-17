import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/sevice/post_service.dart';

import '../sevice/post_model.dart';

class FeedView extends StatefulWidget {
  const FeedView({Key? key}) : super(key: key);

  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView>
    with AutomaticKeepAliveClientMixin {
  late final Future<List<PostModel>?> _itemFuture;

  @override
  void initState() {
    super.initState();
    _itemFuture = _postService.fetchPostItemsAdvance();
  }

  final IPostService _postService = PostService();
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          setState(() {});
        }),
        appBar: AppBar(),
        body: _FeedFutureBuilder(itemFuture: _itemFuture));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class _FeedFutureBuilder extends StatelessWidget {
  const _FeedFutureBuilder({
    Key? key,
    required Future<List<PostModel>?> itemFuture,
  })  : _itemFuture = itemFuture,
        super(key: key);

  final Future<List<PostModel>?> _itemFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PostModel>?>(
        future: _itemFuture, //aç kapat sayfaları için faydalı
        //initialData: InitialData,
        builder:
            (BuildContext context, AsyncSnapshot<List<PostModel>?> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Placeholder();

            case ConnectionState.waiting:
              // TODO: Handle this case.
              break;
            case ConnectionState.active:
              return Center(child: CircularProgressIndicator());
              break;
            case ConnectionState.done:
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                            title: Text(snapshot.data?[index].body ?? '')),
                      );
                    });
              } else {
                return Placeholder();
              }
          }

          //internet olmadığında ya da aktif olmadığında ne yapması gerektiğini söyler
        });
  }
}
