import 'package:flutter/material.dart';

class MyCollectionsDemos extends StatefulWidget {
  const MyCollectionsDemos({Key? key}) : super(key: key);

  @override
  State<MyCollectionsDemos> createState() => _MyCollectionsDemosState();
}

class _MyCollectionsDemosState extends State<MyCollectionsDemos> {
  //late:Dışarıdan sonradan değer almayacaksa,sonradan değer gelecek ama sadece consructor zamanaı
  late final List<CollectionModel> _items;

  @override
  void initState() {
    super.initState();
    _items = CollectionItems().items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: _items.length,
      //Yukardan vermek istersek
      padding: PaddingUtility().paddingGeneral,
      itemBuilder: ((context, index) {
        return _CategoryCard(model: _items[index]);
      }),
    ));
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    Key? key,
    required CollectionModel model,
  })  : _model = model,
        super(key: key);

  final CollectionModel _model;

  @override
  Widget build(BuildContext context) {
    return Card(
        //Aşagıdan vermek istersek carddan istersek
        margin: PaddingUtility().paddingTop,
        child: SizedBox(
            height: 300,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  //Image sığmadığında expanded

                  Expanded(
                      child: Image.asset(_model.imagePath, fit: BoxFit.fill)),
                  //Yanyana gelmesini istiyorsak row
                  Padding(
                    padding: PaddingUtility().paddingBottom,
                    child: Row(
                      //İkisi arasında boşluk vermek istersek de
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(_model.title),
                        Text('${_model.price} eth')
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}

class CollectionModel {
  final String imagePath;
  final String title;
  final int price;

  CollectionModel({
    required this.imagePath,
    required this.title,
    required this.price,
  });
}

class PaddingUtility {
  final paddingTop = const EdgeInsets.only(top: 10);
  final paddingBottom = const EdgeInsets.only(bottom: 20);
  final paddingGeneral = const EdgeInsets.all(20);
}

class CollectionItems {
  late final List<CollectionModel> items;

  CollectionItems() {
    items = [
      CollectionModel(
          imagePath: ProjectImage.imageCollection,
          title: 'Abstract art',
          price: 3),
      CollectionModel(
          imagePath: ' assets/1.png', title: 'Abstract art', price: 3),
      CollectionModel(
          imagePath: ' assets/1.png', title: 'Abstract art', price: 3),
      CollectionModel(
          imagePath: ' assets/1.png', title: 'Abstract art', price: 3),
    ];
  }
}

class ProjectImage {
  static const imageCollection = 'assets/1.png';
}
