import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class User {
  int ID;
  String? Email, UserName, Password, FirstName, LastName, ProfilePicture;
  User(
      {required this.ID,
        required this.UserName,
      required this.Email,
      required this.FirstName,
      required this.LastName,
      required this.Password,
      required this.ProfilePicture});

  // factory UserRegister.fromJson(Map<String, dynamic> json) =>
  //     _$UserRegisterFromJson(json);
  // Map<String, dynamic> toJson() => _$UserRegisterToJson(this);
  User.fromJson(Map<String, dynamic> json)
      :
        ID = json["id"],
        UserName = json['username'],
        Email = json['email'],
        FirstName = json['first_name'],
        LastName = json['last_name'],
        Password = json['pasword'],
        ProfilePicture = json['profile_pic'];

  Map<String, dynamic> toJson() => {
        'id':ID,
        'name': UserName,
        'email': Email,
        "last_name": LastName,
        "password": Password,
        "profile_pic": ProfilePicture
      };
}