import 'package:dio/dio.dart';

///Projelerinde sürekli kurulmayacak ve sabit değişmeyecek ıtemler:Singleton
///Tek bir instance var ve bunun başkası tarafından üretilmemesini istiyoruz
class ProjectNetworkManager {
  late final Dio _dio;
/*
  ProjectNetworkManager() {
    dio = Dio(BaseOptions(baseUrl: 'pub.dev'));
  }*/
  //private çevir
  ProjectNetworkManager._() {
    _dio = Dio(BaseOptions(baseUrl: 'pub.dev'));
  }
  //Singleton yapmak istersek
  static ProjectNetworkManager instance = ProjectNetworkManager._();
  //bu sayede bu classa bu inistance üzerinden eiş

  Dio get service => _dio;

  void addBaseHeaderToToken(String token) {
    _dio.options = _dio.options.copyWith(headers: {"Authorization": token});
  }
}

//Bu datadan bir tane olsun
class DurationManager {
  //Dışardan instance almaya kapalı
  DurationManager._();

  static DurationManager? _manager; //Data dönmeyebilir o yüzden soru işareti
  static DurationManager get manager {
    if (_manager != null) return _manager!;
    _manager = DurationManager._();
    return _manager!;
  } //Data dönecek o yüzden get

}
