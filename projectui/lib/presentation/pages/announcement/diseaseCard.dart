import 'package:flutter/material.dart';
import 'package:projectui/presentation/pages/addImage/addImage.dart';

import '../../../dataprovider/plants.dart';
import 'package:http/http.dart' as http;

class DiseaseCard extends StatefulWidget {
  const DiseaseCard({Key? key}) : super(key: key);

  @override
  State<DiseaseCard> createState() => _DiseaseCardState();
}

class _DiseaseCardState extends State<DiseaseCard> {
  final List<String> entries = [
    "Apple scab",
    "Black rot in Apple",
    "Cedar apple rust",
    "Powdery mildew in cherry",
    "Cercospora gray leaf spot in maize",
    "Common rust in maize",
    "Northern leaf blight in maize",
    "Black rot in grape leaves",
    "Black measles in grape",
    "Isariopsis leaf spot in grape",
    "Haunglongbing(Citrus greening in orange)",
    "Bacterial spot in peach",
    "Bacterial spot in pepper",
    "Early blight in potato",
    "Late blight in potato",
    "Powdery mildew in squash",
    "Leaf scorch in strawberry",
    "Bacterial spot in tomato",
    "Early blight in tomato",
    "Late blight in tomato",
    "Tomato leaf mold in tomato",
    "Septoria leaf spot in tomato",
    "Two-spotted_spider mite in tomato",
    "Tomato target spot",
    "Tomato yellow leaf curl virus",
    "Mosaic virus affecting tomato"
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: entries.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 100,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  boxShadow: [BoxShadow(blurRadius: 7.0, color: Colors.black)]),
              child: Column(
                children: [
                  Expanded(
                      child: Text(
                    entries[index],
                    style: TextStyle(fontSize: 20),
                  )),
                  Center(
                    child: IconButton(
                      onPressed: (() async {
                        PlantProvider? plantProvider =
                            PlantProvider(httpClient: http.Client());

                        print("am am");
                        print(entries[index]);
                        var plants = await plantProvider.getPlants(
                            plant_disease: entries[index] as String);
                        print(plants);
                        print("heyyy");
                        Navigator.of(context)
                            .pushNamed(AddImage.routeName, arguments: plants);
                      }),
                      icon: const Icon(Icons.arrow_right_alt,
                          color: Colors.green, size: 50),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
