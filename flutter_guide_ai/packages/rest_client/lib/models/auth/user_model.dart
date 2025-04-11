import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String? maidenName;
  final int? age;
  final String? gender;
  final String email;
  final String? phone;
  final String username;
  final String? password;
  final String? birthDate;
  final String? image;
  final String? bloodGroup;
  final double? height;
  final double? weight;
  final String? eyeColor;
  final HairModel? hair;
  final String? ip;
  final AddressModel? address;
  final String? macAddress;
  final String? university;
  final BankModel? bank;
  final CompanyModel? company;
  final String? ein;
  final String? ssn;
  final String? userAgent;
  final CryptoModel? crypto;
  final String? role;

  const UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.maidenName,
    this.age,
    this.gender,
    required this.email,
    this.phone,
    required this.username,
    this.password,
    this.birthDate,
    this.image,
    this.bloodGroup,
    this.height,
    this.weight,
    this.eyeColor,
    this.hair,
    this.ip,
    this.address,
    this.macAddress,
    this.university,
    this.bank,
    this.company,
    this.ein,
    this.ssn,
    this.userAgent,
    this.crypto,
    this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        maidenName,
        age,
        gender,
        email,
        phone,
        username,
        password,
        birthDate,
        image,
        bloodGroup,
        height,
        weight,
        eyeColor,
        hair,
        ip,
        address,
        macAddress,
        university,
        bank,
        company,
        ein,
        ssn,
        userAgent,
        crypto,
        role,
      ];
}

@JsonSerializable()
class HairModel extends Equatable {
  final String? color;
  final String? type;

  const HairModel({
    this.color,
    this.type,
  });

  factory HairModel.fromJson(Map<String, dynamic> json) =>
      _$HairModelFromJson(json);

  Map<String, dynamic> toJson() => _$HairModelToJson(this);

  @override
  List<Object?> get props => [color, type];
}

@JsonSerializable()
class AddressModel extends Equatable {
  final String? address;
  final String? city;
  final String? state;
  final String? stateCode;
  final String? postalCode;
  final CoordinatesModel? coordinates;
  final String? country;

  const AddressModel({
    this.address,
    this.city,
    this.state,
    this.stateCode,
    this.postalCode,
    this.coordinates,
    this.country,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);

  @override
  List<Object?> get props => [
        address,
        city,
        state,
        stateCode,
        postalCode,
        coordinates,
        country,
      ];
}

@JsonSerializable()
class CoordinatesModel extends Equatable {
  final double? lat;
  final double? lng;

  const CoordinatesModel({
    this.lat,
    this.lng,
  });

  factory CoordinatesModel.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinatesModelToJson(this);

  @override
  List<Object?> get props => [lat, lng];
}

@JsonSerializable()
class BankModel extends Equatable {
  final String? cardExpire;
  final String? cardNumber;
  final String? cardType;
  final String? currency;
  final String? iban;

  const BankModel({
    this.cardExpire,
    this.cardNumber,
    this.cardType,
    this.currency,
    this.iban,
  });

  factory BankModel.fromJson(Map<String, dynamic> json) =>
      _$BankModelFromJson(json);

  Map<String, dynamic> toJson() => _$BankModelToJson(this);

  @override
  List<Object?> get props => [cardExpire, cardNumber, cardType, currency, iban];
}

@JsonSerializable()
class CompanyModel extends Equatable {
  final String? department;
  final String? name;
  final String? title;
  final AddressModel? address;

  const CompanyModel({
    this.department,
    this.name,
    this.title,
    this.address,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyModelToJson(this);

  @override
  List<Object?> get props => [department, name, title, address];
}

@JsonSerializable()
class CryptoModel extends Equatable {
  final String? coin;
  final String? wallet;
  final String? network;

  const CryptoModel({
    this.coin,
    this.wallet,
    this.network,
  });

  factory CryptoModel.fromJson(Map<String, dynamic> json) =>
      _$CryptoModelFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoModelToJson(this);

  @override
  List<Object?> get props => [coin, wallet, network];
} 