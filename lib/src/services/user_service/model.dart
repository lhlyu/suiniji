// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class CheckUserMobile {
  bool? has;
  int? signal;

  CheckUserMobile({
    this.has,
    this.signal,
  });

  factory CheckUserMobile.fromJson(Map<String, dynamic> json) => _$CheckUserMobileFromJson(json);

  Map<String, dynamic> toJson() => _$CheckUserMobileToJson(this);

  CheckUserMobile copyWith({
    bool? has,
    int? signal,
  }) {
    return CheckUserMobile(
      has: has ?? this.has,
      signal: signal ?? this.signal,
    );
  }
}

@JsonSerializable()
class UserMobile {
  String? uid;
  String? token;

  UserMobile({
    this.uid,
    this.token,
  });

  factory UserMobile.fromJson(Map<String, dynamic> json) => _$UserMobileFromJson(json);

  Map<String, dynamic> toJson() => _$UserMobileToJson(this);

  UserMobile copyWith({
    String? uid,
    String? token,
  }) {
    return UserMobile(
      uid: uid ?? this.uid,
      token: token ?? this.token,
    );
  }
}

@JsonSerializable()
class UserLoginAndRegisterModel {
  String? mobile;
  int? kind;
  int? code;
  int? signal;
  String? password;

  UserLoginAndRegisterModel({
    this.mobile,
    this.kind,
    this.code,
    this.signal,
    this.password,
  });

  factory UserLoginAndRegisterModel.fromJson(Map<String, dynamic> json) => _$UserLoginAndRegisterModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserLoginAndRegisterModelToJson(this);

  UserLoginAndRegisterModel copyWith({
    String? mobile,
    int? kind,
    int? code,
    int? signal,
    String? password,
  }) {
    return UserLoginAndRegisterModel(
      mobile: mobile ?? this.mobile,
      kind: kind ?? this.kind,
      code: code ?? this.code,
      signal: signal ?? this.signal,
      password: password ?? this.password,
    );
  }
}
