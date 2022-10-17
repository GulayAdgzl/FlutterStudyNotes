import 'package:flutter/material.dart';

class ListViewBuilderLearn extends StatefulWidget {
  const ListViewBuilderLearn({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderLearn> createState() => _ListViewBuilderLearnState();
}

//eğer müşteri her karttan sonra bir şey olmasını istşyorsa separatorBuilder kullan
class _ListViewBuilderLearnState extends State<ListViewBuilderLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          //body:ListView.separated(separatorBuilder: (context,index){retrun const Divider();color:Colors.white;})

          //Random ımage ile
          //return SizedBox(height:200,child:Column(children:[Expanded(child:Image.network('')]),Text('$index'))
          //print(index);
          return Column(
            children: [
              const Placeholder(
                color: Colors.red,
              ),
              Text('$index'),
            ],
          );
        },
        //itemCount:15,
      ),
    );
  }
}
