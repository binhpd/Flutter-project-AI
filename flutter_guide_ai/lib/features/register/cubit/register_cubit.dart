import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_client/rest_client.dart';
import '../../../repositories/register/register_repository.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepository _repository;

  RegisterCubit(this._repository) : super(const RegisterState.initial());

  Future<void> register({
    required String fullName,
    String? gender,
    required String contactNumber,
    required String email,
    required String password,
    String? reason,
  }) async {
    emit(const RegisterState.loading());

    try {
      final request = RegisterRequest(
        fullName: fullName,
        gender: gender,
        contactNumber: contactNumber,
        email: email,
        password: password,
        reason: reason,
      );

      final response = await _repository.register(request);
      emit(RegisterState.success(response));
    } catch (e) {
      emit(RegisterState.error(e.toString()));
    }
  }
} 