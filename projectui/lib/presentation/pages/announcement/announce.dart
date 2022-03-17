import 'package:flutter/material.dart';
import 'package:projectui/presentation/pages/announcement/diseaseCard.dart';

class Announce extends StatefulWidget {
  static const String routeName = "/announce";

  const Announce({Key? key}) : super(key: key);

  @override
  State<Announce> createState() => _AnnounceState();
}

class _AnnounceState extends State<Announce> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Announcement"),),
      body: DiseaseCard(),
    );
  }
}
