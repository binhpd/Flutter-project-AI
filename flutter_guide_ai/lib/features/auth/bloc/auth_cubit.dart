import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_client/rest_client.dart';
import '../../../repositories/auth/auth_repository.dart';
import '../../../services/auth/auth_service.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  final AuthService _authService;

  AuthCubit(this._authRepository, this._authService) : super(const AuthState.initial());

  Future<void> login(String username, String password) async {
    emit(const AuthState.loading());

    try {
      final request = LoginRequest(
        username: username,
        password: password,
      );

      final response = await _authRepository.login(request);
      await _authService.saveTokens(response.accessToken, response.refreshToken);

      final user = await _authRepository.getUser();
      await _authService.saveUser(user);

      emit(const AuthState.success());
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> logout() async {
    emit(const AuthState.loading());
    try {
      await _authService.clearAuth();
      emit(const AuthState.initial());
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }
} 