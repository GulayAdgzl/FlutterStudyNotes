import 'package:flutter/cupertino.dart';

import '../../../../product/global/resource_context.dart';
import '../model/resoruce_model.dart';
import '../service/reqrest_service.dart';

class ReqResProvider extends ChangeNotifier {
  final IReqresService reqrestservice;
  List<Data> resources = [];
  bool isLoading = false;
  void _changeLoading() {
    //setState yok çünkü kendi kendi viewModelimiz -class
    isLoading = !isLoading;
    notifyListeners(); //Bu işlem change loading değişti bunu dinle öyle kullan demek
  }

  ReqResProvider(this.reqrestservice) {
    _fetch();
  }

  Future<void> _fetch() async {
    _changeLoading();
    resources = (await reqrestservice.fetchResourceItem())?.data ?? [];
    _changeLoading();
  }

  void saveToLocale(ResourceContext resourceContext) {
    resourceContext.saveModel(ResourceModel(data: resources));
  }
}
