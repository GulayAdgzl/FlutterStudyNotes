import 'package:url_launcher/url_launcher.dart';

mixin LaunchMixinTrend {
  void launchURL(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    }
  }
}
