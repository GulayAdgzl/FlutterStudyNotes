import 'package:flutter/material.dart';
import 'package:flutter_application_1/202/303/reqrest_resource/service/reqrest_service.dart';
import 'package:flutter_application_1/202/303/reqrest_resource/viewModel/req_res_provider.dart';
import 'package:flutter_application_1/product/global/resource_context.dart';
import 'package:flutter_application_1/product/global/theme_notifider.dart';
import 'package:flutter_application_1/product/service/project_network_namager.dart';
import 'package:provider/provider.dart';
import '../../../product/extension/string_extension.dart';

import '../viewModel/req_res_ViewModel.dart';

class ReqResViewPro extends StatefulWidget {
  @override
  State<ReqResViewPro> createState() => _ReqResViewProState();
}

class _ReqResViewProState extends State<ReqResViewPro> with ProjectDioMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReqResProvider>(
        create: (context) => ReqResProvider(ReqresService(service)),
        builder: (context, child) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(onPressed: () {
              context.read<ThemeNotifier>().changeTheme();
            }),
            appBar: AppBar(
                actions: [
                  IconButton(
                      onPressed: () {
                        context
                            .read<ThemeNotifier>()
                            .saveToLocale(context.read<ResourceContext>());
                      },
                      icon: Icon(Icons.abc_sharp))
                ],
                title: context.watch<ReqResProvider>().isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : null),
            body: Column(
              children: [
                Selector<ReqResProvider, bool>(
                    builder: (context, value, child) {
                  return value ? Placeholder() : Text('data');
                }, selector: (context, provider) {
                  return provider.isLoading;
                }),
                Expanded(
                    child: _resourcesListView(
                        context, context.watch<ReqResProvider>().resources)),
              ],
            ),
          );
        });
  }

  ListView _resourcesListView(BuildContext context, List<Data> items) {
    return ListView.builder(
        itemCount: items.length,
        //context.watch<ReqResProvider>().resources.length,
        itemBuilder: (BuildContext context, int index) {
          items[index].colorValue;
          return Card(
              color: Color(items[index].color?.colorValue ?? 0),
              child: Text(items[index].name ?? ''));
        });
  }
}
