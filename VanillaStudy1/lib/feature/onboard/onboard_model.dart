class OnBoardModel {
  final String title;
  final String description;
  final String imageName;

  OnBoardModel(this.title, this.description, this.imageName);
  String get imageWithPath => 'assets/images/$imageName.png';
}

class OnBoardModels {
  static final List<OnBoardModel> onBoardItems = [
    OnBoardModel('Order mODEL', 'Now You', 'ic_chef'),
    OnBoardModel('Order mODEL', 'Now You', 'ic_delivery'),
    OnBoardModel('Order mODEL', 'Now You', 'ic-order'),
  ];
}
