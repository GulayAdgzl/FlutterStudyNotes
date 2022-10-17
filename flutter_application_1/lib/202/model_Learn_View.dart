import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/model_learn.dart';
//import 'package:flutter_application_1/202/model_learn.dart';

class ModelLearnView extends StatefulWidget {
  const ModelLearnView({Key? key}) : super(key: key);

  @override
  State<ModelLearnView> createState() => _ModelLearnViewState();
}

class _ModelLearnViewState extends State<ModelLearnView> {
  PostModel8 user9 = PostModel8(body: 'w');
//PostModel benden hiçbir şey istemedi çnkü hepsini nullable işaretledik ve concructor da bunu oluşturmadığı için

  @override
  void initState() {
    super.initState();
    final user1 = PostModel1()
      ..userId = 1
      ..body = 'sss';
    //ya da  2 nokta ile de bu eşitlemeyi yaparız

    // user1.body = "aaaa";
//postmodel user1. ile dolduracak

    //PostModel2
    final user2 = PostModel2(userId: 1, id: 2, title: "aaa", body: "aaad");
    //ya da
    user2.body = "aaad";

    //Postmodel3
    final user3 = PostModel3(1, 2, 'w', 'd');
    //ama böyle yaptırmıyo değiştirtmiyp
    //user3.body = "sa";

    //PostModel4-Localden yani textview vs ile yapıyorsan bu yöntem

    final user4 = PostModel4(1, 2, 'e', 'r');
    //user4.body = ""; //yine göremedik

    //Postmodel5
    final user5 = PostModel5(userId: 1, id: 2, title: 'title', body: 'body');
    user5.userId;

    //Postmodel6
    final user6 = PostModel6(userId: 1, id: 2, title: 'title', body: 'body');
    //PostModel7
    final user7 = PostModel7();

    //postmodel8-Servisten data çekiyorsam en mantıklı yöntem
    final user8 = PostModel8();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // user9 = PostModel8(title: 'on pressed');
            user9 = user9.copyWith(title: 'qqq');
            user9.udpdateBody('data');
          });
        },
      ),
      appBar: AppBar(title: Text(user9.body ?? 'sssss')),
    );
  }
}
