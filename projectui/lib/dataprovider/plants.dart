import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart';
import 'package:async/async.dart';
import 'package:dartz/dartz.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'package:projectui/models/plant.dart';
import 'package:projectui/presentation/constant.dart';

const rootUrl = 'https://8c6a-197-156-95-201.ngrok.io/api/v1/plant/by_name/';
Uri getPlants = Uri.parse(rootUrl);

class PlantProvider {
  final http.Client httpClient;
  PlantProvider({required this.httpClient});

  Future<List<Plant?>?> getPlants({required String? plant_disease}) async {
    print("object");
    try {
      print("Amh her");
      var response = await httpClient.get(
          Uri.parse(
              'https://e593-197-156-103-229.ngrok.io/api/v1/plant/by_name/${plant_disease}/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${token}'
          });
      print("REsponse ${response.body}");
      if (response.statusCode == 200) {
        final parsed = json.decode(response.body);
        print('$parsed parsed');
        List<Plant?> plants = [];
        for (var plant in parsed) {
          Plant? pp = Plant.fromJson(plant);
          plants.add(pp);
        }
         print(plants);
        return plants;

        print(parsed);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<String?> predict({required dynamic image}) async {
    var stream = new http.ByteStream(DelegatingStream.typed(image.openRead()));
      // get file length
      var length = await image.length();

      // string to uri
      var uri = Uri.parse("https://e593-197-156-103-229.ngrok.io/api/v1/plant/predict/image/model/");

      // create multipart request
      var request = new http.MultipartRequest("POST", uri);

      // add headers with Auth token
      Map<String, String> headers = { "Authorization": "Bearer $token",'Content-Type': 'application/json; charset=UTF-8',};

      request.headers.addAll(headers);

      // multipart that takes file
      var multipartFile = await http.MultipartFile.fromPath(
    'file', image.path,);

      // add file to multipart
      request.files.add(multipartFile);

http.StreamedResponse responses = await request.send();
      // 'disease_name']);

      // listen for response
     var response = await http.Response.fromStream(responses);
     var name = json.decode(response.body)['disease_name'];
     print(name);
    return name;

  }
}
