import 'package:flutter/material.dart';
import 'package:projectui/presentation/pages/signin/signin_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Yiwekut',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      body: Center(
        child: SignIn() 
    ),),);
  }
}