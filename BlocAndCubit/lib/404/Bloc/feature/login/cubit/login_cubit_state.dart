import 'package:equatable/equatable.dart';
import 'package:flutter_full_learn/product/model/token_model.dart';

import '../model/login_model.dart';

class LoginState extends Equatable {
  final bool isLoading;
  final LoginModel? model;
  //Başarılı olup olmadığı anlaşılsın dersek
  final TokenModel? tokenModel;
  final bool isCompleted;

  const LoginState(
      {this.isLoading = false, this.model,  this.tokenModel,this.isCompleted=false});

  @override
  // TODO: implement props
  List<Object?> get props => [
        isLoading,
        model
      ]; //Sayfada  isLoading değişmadikçe sayfayı tetiklemesin istediğimiz için

  LoginState copyWith({
    bool? isLoading,
    LoginModel? model,
    TokenModel? tokenModel,
    bool? isCompleted,
  }) {
    return LoginState(
      isLoading: isLoading ?? false,//this.isLoading,
      model: model ?? this.model,
      tokenModel: tokenModel ?? this.tokenModel,
      isCompleted: isCompleted ?? false,
    );
  }
}
