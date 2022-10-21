import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_full_learn/404/Bloc/feature/login/model/login_model.dart';

import '../service/login_service.dart';
import 'login_cubit_state.dart';

class LoginCubit extends Cubit<LoginState> {
  //Servisi bağlama
  LoginCubit(ILoginService loginService)
      : _loginService = loginService,
        super(LoginState());
  final ILoginService _loginService;

  Future<void> checkUser(String email, String password) async {
    //Ekrana bir söylemek
    emit(state.copyWith(isLoading: true, model: LoginModel(email, password))

        /*LoginState(     
    isLoading: true,model:LoginModel(email,password))*/
        );
    final response = await _loginService.login(state.model!);
    /*Future.delayed(const Duration(seconds: 1));*/
    /* emit(state.copyWith(isLoading: false)
        /*const LoginState(isLoading: false)*/
        );*/
    emit(state.copyWith(isLoading: false, isCompleted: response?.data != null));
  }
}
