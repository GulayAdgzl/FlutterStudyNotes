import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_full_learn/404/Bloc/feature/login/cubit/login_cubit.dart';
import 'package:flutter_full_learn/404/Bloc/feature/login/cubit/login_cubit_state.dart';
import 'package:flutter_full_learn/404/Bloc/feature/login/service/login_service.dart';
import 'package:flutter_full_learn/404/Bloc/feature/login/service/vexana_network_manager.dart';
import 'package:kartal/kartal.dart';
import 'package:vexana/vexana.dart';
part 'login_view.g.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

//Note:ViewModel e UI kodu koyma
class _LoginViewState extends State<LoginView> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formLoginKey = GlobalKey();

  final _loginText = 'Login';
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
        create: (context) => LoginCubit(LoginService(
            VexanaNetworkManager()) /*NetworkManager(options:BaseOptions()))*/),
        child: Scaffold(
            appBar: AppBar(
              //appbar cubite erişemez çünkü onu kapsamıyor
              title: BlocBuilder<LoginCubit, LoginState>(
                builder: ((context, state) {
                  return state.isLoading
                      ? CircularProgressIndicator(
                          color: context.colorScheme.secondary)
                      : const SizedBox();
                }),
              ),
            ),
            body: Form(
              autovalidateMode: AutovalidateMode.always,
              key: _formLoginKey,
              child: Padding(
                padding: PagePadding.all(),
                child: Column(
                  children: [
                    _LoginEmailFields(
                      controller: _emailController,
                      passwordController: _passwordController,
                    ),
                    /*SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                      child:*/
                    BlocConsumer<LoginCubit, LoginState>(
                        listener: (context, state) {
                      if (state.isCompleted) {
                        context.navigateToPage(
                            page); //başka sayfaya geçiş sağladık
                      }
                    }, builder: (context, state) {
                      return ElevatedButton(
                        onPressed: () {
                          if (_formLoginKey.currentState?.validate() ?? false) {
                            context.read<LoginCubit>().checkUser(
                                _emailController.text,
                                _passwordController.text);
                          }
                        },
                        child: Text('$_loginText- ${state.model?.email ?? ''}'),
                      );
                    }),
                  ],
                ),
              ),
            )));
  }
}

class _LoginEmailFields extends StatelessWidget {
  const _LoginEmailFields({
    Key? key,
    required TextEditingController controller,
    required TextEditingController passwordController,
  })  : _emailController = controller,
        _passwordController = passwordController,
        super(key: key);
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    //isLoading durumdayken sadece isLoading i dinlemek istersek-widget görünmesin:BlocSelector
    return BlocSelector<LoginCubit, LoginState, bool>(selector: (state) {
      return state.isLoading;
    }, builder: (context, state) {
      return IgnorePointer(
        ignoring: true,
        child: AnimatedOpacity(
          duration: context.durationLow,
          opacity: state ? 0.3 : 1,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  controller: _emailController,
                  validator: (String? data) =>
                      (data?.isValidEmail ?? false) ? null : 'Problem',
                  decoration: InputDecoration(labelText: 'E mail'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  controller: _passwordController,
                  validator: (String? data) =>
                      ((data?.length ?? 0) > 6) ? null : 'Problem',
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Password'),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}


class PagePadding extends EdgeInsets {
  const PagePadding.all() : super.all(20);
  const PagePadding.bottom() : super.only(bottom: 10);
}
