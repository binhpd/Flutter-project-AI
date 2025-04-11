import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest extends Equatable {
  final String fullName;
  final String? gender;
  final String contactNumber;
  final String email;
  final String password;
  final String? reason;

  const RegisterRequest({
    required this.fullName,
    this.gender,
    required this.contactNumber,
    required this.email,
    required this.password,
    this.reason,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);

  @override
  List<Object?> get props => [fullName, gender, contactNumber, email, password, reason];
} 