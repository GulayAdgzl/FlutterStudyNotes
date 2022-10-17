import '../../303/lottie_learn.dart';
import '../../303/navigation/navigate_home_detail.dart';
import '../../303/navigation/navigate_home_view.dart';

class NavigatorRouters {
  static const _parag = "/";
  final items = {
    /*
    "/": (context) => const LottieLearn(),
    "/home": (context) => const NavigateHomeView(),
    "/homeDetail": (context) => const NavigateHomeDetailView(),
    */
    _parag: (context) => const LottieLearn(),
    NavigatorRouter.home.withPraf: (context) => const NavigateHomeView(),
    NavigatorRouter.detail.withPraf: (context) =>
        const NavigateHomeDetailView(),
  };
}

enum NavigatorRouter { init, home, detail }

extension NavigatorRoutersExtension on NavigatorRouter {
  String get withPraf => "/$name";
}
