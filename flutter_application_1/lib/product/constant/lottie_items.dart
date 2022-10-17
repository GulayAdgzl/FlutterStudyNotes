enum LottieItems { themeChange }

extension LottieItemsExtension on LottieItems {
  String _path() {
    //String _mainPath='assets/lottie/';
    switch (this) {
      case LottieItems.themeChange:
        //return 'assets/lottie/lottie_theme_change.json';
        return 'lottie_theme_change';
    }
  }

  String get lottiePath => 'assets/lottie/${_path()}.json';
}
