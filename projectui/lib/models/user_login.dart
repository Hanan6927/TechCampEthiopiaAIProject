import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class UserLogin {
  String? Email,Password;
  UserLogin({
      required this.Email,
      required this.Password,});

  // factory UserRegister.fromJson(Map<String, dynamic> json) =>
  //     _$UserRegisterFromJson(json);
  // Map<String, dynamic> toJson() => _$UserRegisterToJson(this);
  UserLogin.fromJson(Map<String, dynamic> json)
      :
        Email = json['email'],
        Password = json['pasword'];

  Map<String, dynamic> toJson() => {
        'email': Email,
        "password": Password,
      };
}