import 'package:joya/data/services/api/joya/auth.dart';

class AuthRepository {
  final AuthService _authService;

  const AuthRepository({required AuthService authService})
      : _authService = authService;

  void login({required String email, required String password}) async {
    await _authService.login(email: email, password: password);
  }
}
