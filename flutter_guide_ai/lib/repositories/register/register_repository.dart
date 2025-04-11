import 'package:rest_client/rest_client.dart';

abstract class RegisterRepository {
  Future<RegisterResponse> register(RegisterRequest request);
}

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterApi _api;

  RegisterRepositoryImpl(this._api);

  @override
  Future<RegisterResponse> register(RegisterRequest request) {
    return _api.register(request);
  }
} 