//mixin:concructoru olmayan classlar
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

mixin LaunchMixin on State<StatefulWidget> {
  void launchURL(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    }
  }
}
