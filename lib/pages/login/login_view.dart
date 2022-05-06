import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joya/common/utils/navigation.dart';
import 'package:joya/common/utils/snackbar.dart';
import 'package:joya/pages/login/cubit/login_cubit.dart';
import 'package:joya/pages/login/widgets/action_buttons.dart';
import 'package:joya/pages/login/widgets/login_form_fields.dart';
import 'package:joya/pages/scan/cubit/scan_page.dart';
import 'package:joya/pages/sensors/cubit/sensors_page.dart';
import 'package:joya/pages/sensors/sensors_view.dart';

class LoginView2 extends StatefulWidget {
  const LoginView2({
    Key? key,
  }) : super(key: key);

  @override
  _LoginView2State createState() => _LoginView2State();
}

class _LoginView2State extends State<LoginView2> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription _intentDataStreamSubscription;

  @override
  void initState() {
    super.initState();
    context.read<LoginCubit>().getCurrentUser();
  }

  @override
  void dispose() {
    _intentDataStreamSubscription.cancel();
    super.dispose();
  }

  void updateUI(LoginState state) {
    debugPrint(state.runtimeType.toString());
    if (state is LoginSuccess) {
      navigationPushByName(context, SensorsPage.pageName);
    } else if (state is LoginError) {
      showWarningSnackbar(context, state.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          updateUI(state);
        },
        builder: (context, state) {
          return state is LoginInitial
              ? const CircularProgressIndicator(
                  strokeWidth: 1.5,
                )
              : Scaffold(
                  resizeToAvoidBottomInset: true,
                  body: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.all(0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: LoginFormFields(
                                email: context.read<LoginCubit>().email,
                                password: context.read<LoginCubit>().password,
                                isValidEmail:
                                    context.read<LoginCubit>().isValidEmail,
                                isValidPassword:
                                    context.read<LoginCubit>().isValidPassword,
                                setEmail: context.read<LoginCubit>().setEmail,
                                setPassword:
                                    context.read<LoginCubit>().setPassword,
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 25),
                            ActionButtonsLogin(
                              loginState: state,
                              submit: context.read<LoginCubit>().login,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
