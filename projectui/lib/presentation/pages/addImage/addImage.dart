import 'package:flutter/material.dart';
import 'package:projectui/dataprovider/plants.dart';
import 'package:http/http.dart' as http;

import '../../../models/plant.dart';

class AddImage extends StatefulWidget {
  static const String routeName = "/addimage";
  const AddImage({Key? key}) : super(key: key);

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List<Plant?>;
    PlantProvider? plantProvider = PlantProvider(httpClient: http.Client());

    return Scaffold(
        appBar: AppBar(title: Text("Disease name")),
        body: ListView.builder(
          itemCount: args.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    boxShadow: [BoxShadow(blurRadius: 7.0, color: Colors.black)]),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      args[index]!.PlantName!,
                      style: TextStyle(fontSize: 20),
                    )),
                    Expanded(
                      child: SizedBox(
                          height: 150,
                          width: 150,
                          child: Image.network(
                              'https://0f55-197-156-103-128.ngrok.io${args[index]!.PlantPic!}')),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
