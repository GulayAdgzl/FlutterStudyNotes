import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/product/navigator/navigator_routers.dart';
import 'package:flutter_full_learn/product/constant/duration_items.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_full_learn/product/global/theme_notifider.dart';

import '../../product/constant/lottie_items.dart';

class LottieLearn extends StatefulWidget {
  const LottieLearn({Key? key}) : super(key: key);

  @override
  State<LottieLearn> createState() => _LottieLearnState();
}

class _LottieLearnState extends State<LottieLearn>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  bool isLight = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: DurationItems.durationNormal());
    NavigationToHome();
  }

  //Navigation için
  Future<void> NavigationToHome() async {
    await Future.delayed(Duration(seconds: 1));
    Navigator.of(context).pushNamed(NavigatorRouter.home.withPraf); //sola git
    //gittiğinde tekrar o sayfaya dönmesin dersek
    Navigator.of(context).pushReplacementNamed(NavigatorRouter.home.withPraf);
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            InkWell(
                //Bir ileri bir geri gelmes için
                onTap: () async {
                  await controller.animateTo(isLight ? 0.5 : 1);

                  isLight = !isLight;
                  //controller.animateTo(0.5);
                  //Ekrandaki işin bitmesini istiyorsan
                  Future.microtask(() {
                    context.read<ThemeNotifier>().changeTheme();
                  });
                },
                child: Lottie.asset(
                  LottieItems.themeChange.lottiePath,
                  //tekrar etmesini istemedğim için false
                  repeat: false,
                  //kontrol etmek içib
                  controller: controller,
                )),
          ],
        ),
        body: LoadingLottie());
  }
}

class LoadingLottie extends StatelessWidget {
  const LoadingLottie({
    Key? key,
  }) : super(key: key);
  final _loading =
      'https://assets2.lottiefiles.com/private_files/lf30_ykdoon9j.json';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.network(_loading),
    );
  }
}
