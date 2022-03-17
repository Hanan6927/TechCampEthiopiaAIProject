import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:projectui/models/user_register.dart';

import '../models/user.dart';

const rootUrl = 'https://e593-197-156-103-229.ngrok.io/api/v1/user/register/';
Uri addUser = Uri.parse(rootUrl);
class RegisterProvider{
  final http.Client httpClient;
  RegisterProvider({required this.httpClient});
  // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
  static Future<User?> registerUser({UserRegister? user}) async {
    final response = await http.post(addUser,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          },
        body: jsonEncode(<String, dynamic>{
          'username': user!.UserName,
          'email': user.Email,
          'first_name': user.FirstName,
          'last_name': user.LastName,
          'password': user.Password,
          'profile_pic': user.ProfilePicture,
        }));
        final parsed = json.decode(response.body);
    print(parsed["data"]);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return User.fromJson(parsed["data"]);
    } else {
      return null;
    }
  }
}