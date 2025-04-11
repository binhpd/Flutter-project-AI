// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    RegisterRequest(
      fullName: json['fullName'] as String,
      gender: json['gender'] as String?,
      contactNumber: json['contactNumber'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'gender': instance.gender,
      'contactNumber': instance.contactNumber,
      'email': instance.email,
      'password': instance.password,
      'reason': instance.reason,
    };
