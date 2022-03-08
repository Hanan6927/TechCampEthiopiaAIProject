import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:projectui/models/user_register.dart';

class RegisterProvider{
  final http.Client httpClient;
  RegisterProvider({required this.httpClient});
  Future<Either<String, UserRegister>> signUp({required UserRegister}) async {
    // TODO: implement signUp
    
    try {
      final response = await httpClient.post(
        Uri.http("http://127.0.0.1:8000/", "api/v1/register/"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(UserRegister),
      );
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        final parsed = json.decode(response.body);
        print(parsed);
        // await LoginProvider.getSharedPrefernce();
        // await LoginProvider.setItemToLocalStrage(
        //     tokenName: "userCred", dataToStore: jsonEncode(userCred));
        return right(UserRegister.fromJson(parsed));
      } else if (response.statusCode == 400) {
        final parsed = json.decode(response.body);
        return left(parsed["message"]);
      } else if (response.statusCode == 404) {
        return left("Can not connect to internet");
      }
      return left("Some Error Happened");
    } on SocketException catch (e) {
      print(e.message);
      return left("Can not connect to internet ${e.runtimeType}");
    }
  }
}