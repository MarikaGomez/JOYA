import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joya/data/repositories/joya/auth.dart';
import 'package:joya/data/services/api/joya/auth.dart';
import 'package:joya/pages/login/cubit/login_cubit.dart';
import 'package:joya/pages/login/login_view.dart';

class LoginPage2 extends StatelessWidget {
  static String pageName = "login";

  LoginPage2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepository(authService: AuthService()),
        ),
      ],
      child: BlocProvider(
        create: (context) => LoginCubit(
          authRepository: context.read<AuthRepository>(),
        ),
        child: LoginView2(),
      ),
    );
  }
}
