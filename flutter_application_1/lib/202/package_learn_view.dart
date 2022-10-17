/*
import 'package:flutter/material.dart';
import 'package:flutter_application_1/202/package/loading_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package/launch_manager.dart';

class PackageLearnView extends StatefulWidget {
  const PackageLearnView({Key? key}) : super(key: key);

  @override
  State<PackageLearnView> createState() => _PackageLearnViewState();
}

class _PackageLearnViewState extends State<PackageLearnView>
    with TickerProviderStateMixin, LaunchMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor:  Theme.of(context).buttonTheme.colorScheme?.onPrimary,
        onPressed: () {
          launchURL(
              'https://code.visualstudio.com/docs/getstarted/tips-and-tricks#_preventing-dirty-writes');
        },
      ),
      body: const LoadingBar(),
    );
  }
}
*/
