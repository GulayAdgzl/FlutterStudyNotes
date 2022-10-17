import 'package:flutter/material.dart';
import 'package:flutter_application_1/product/extension/string_extension.dart';

import '../viewModel/req_res_ViewModel.dart';

abstract class ReqResView extends StatefulWidget {
  const ReqResView({Key? key}) : super(key: key);
}

class _ReqResViewState extends ReqResViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: isLoading ? const CircularProgressIndicator() : null),
      body: ListView.builder(
          itemCount: resources.length,
          itemBuilder: (BuildContext context, int index) {
            resources[index].colorValue;
            return Card(
                color: Color(resources[index].color?.colorValue),
                child: Text(resources[index].name ?? ''));
          }),
    );
  }
}
//38.00 da kaldım