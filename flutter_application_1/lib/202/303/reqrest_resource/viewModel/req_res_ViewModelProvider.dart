import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../../product/service/project_network_namager.dart';
import '../model/resoruce_model.dart';
import '../service/reqrest_service.dart';
import '../view/req_resView.dart';

abstract class ReqResViewModelPro extends LoadingStatefull<ReqResView>
    with ProjectDioMixin {
  //late final :sadece initState içinde eşitle anlamaına gelir
  late final IReqresService reqrestservice;
  List<Data> resources = [];

  void initState() {
    super.initState();
    reqrestservice = ReqresService(service);
    _fetch();
  }

  Future<void> _fetch() async {
    changLoading();
    resources = (await reqrestservice.fetchResourceItem())?.data ?? [];
    changLoading();
  }
}
