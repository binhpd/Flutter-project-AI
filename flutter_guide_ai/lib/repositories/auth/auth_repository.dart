import 'package:rest_client/rest_client.dart';

abstract class AuthRepository {
  Future<LoginResponse> login(LoginRequest request);
  Future<UserModel> getUser();
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthApi _api;

  AuthRepositoryImpl(this._api);

  @override
  Future<LoginResponse> login(LoginRequest request) {
    return _api.login(request);
  }

  @override
  Future<UserModel> getUser() {
    return _api.getUser();
  }
} 