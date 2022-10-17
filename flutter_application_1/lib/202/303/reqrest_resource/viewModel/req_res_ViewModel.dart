import 'package:flutter_full_learn/202/303/reqrest_resource/view/req_resView.dart';

import '../../../../product/service/project_network.dart';
import '../../../../product/service/project_network_namager.dart';

import '../model/resoruce_model.dart';
import '../service/reqrest_service.dart';

abstract class ReqResViewModel extends LoadingStatefull<ReqResView>
    with ProjectDioMixin {
  //late final :sadece initState içinde eşitle anlamaına gelir
  late final IReqresService reqrestservice;
  List<Data> resources = [];

  @override
  void initState() {
    super.initState();
    //reqrestservice = ReqresService(service);
    reqrestservice = ReqresService(ProjectNetworkManager.instance.service);
    //token:instanceyi kullanan bütün requestlere uygulandı
    ProjectNetworkManager.instance.addBaseHeaderToToken('aaaa');
    _fetch();
  }

  Future<void> _fetch() async {
    changLoading();

    resources = await reqrestservice.fetchResourceItem().data ?? [];
    changLoading();
  }
}
