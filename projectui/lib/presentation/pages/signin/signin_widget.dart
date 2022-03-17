// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:projectui/dataprovider/userRegister.dart';
import 'package:projectui/dataprovider/user_login.dart';
import 'package:projectui/models/user_login.dart';
import 'package:projectui/models/user_register.dart';
import 'package:http/http.dart' as http;
import 'package:projectui/presentation/constant.dart';
import 'package:projectui/presentation/pages/app_widget.dart';
import 'package:projectui/presentation/pages/home/home_widget.dart';
import 'package:projectui/presentation/pages/signup/signup_widget.dart';

class SignIn extends StatefulWidget {
  static const String routeName = "/singin";
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

final emailController = TextEditingController();
final passwordController = TextEditingController();

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background.jpg"),
                  fit: BoxFit.fitHeight),
            ),
          ),
          Container(
            color: Color.fromARGB(70, 6, 31, 6),
          ),
          Container(
            child: ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 180),
                  child: Center(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Center(
                    child: Row(
                      children: const [
                        Center(
                          child: Image(
                              image: AssetImage("assets/images/logo2.png"),
                              height: 80),
                        ),
                        Center(
                          child: Text(
                            "Yiwequt",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 30.0,
                                fontFamily: 'bold',
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(255, 255, 255, 1)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
                          child: TextFormField(
                            controller: emailController,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.white)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.white)),
                                hoverColor: Colors.white,
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 2)),
                                labelText: 'Enter your email',
                                labelStyle: TextStyle(color: Colors.white)),

                            // The validator receives the text that the user has entered.
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
                          child: TextFormField(
                            controller: passwordController,
                            style: const TextStyle(color: Colors.white),
                            obscureText: true,
                            decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.white)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.white)),
                                hoverColor: Colors.white,
                                labelText: 'Enter Password',
                                labelStyle: TextStyle(color: Colors.white)),

                            // The validator receives the text that the user has entered.
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.all(20)),
                              ),
                              onPressed: () async {
                                // Validate returns true if the form is valid, or false otherwise.
                                if (_formKey.currentState!.validate()) {
                                  var user = UserLogin(
                                    Email: emailController.text,
                                    Password: passwordController.text,
                                  );
                                  LoginProvider loginProvider =
                                      LoginProvider(httpClient: http.Client());
                                  var ue =
                                      await LoginProvider.loginUser(user: user);
                                  print(ue!.ID);
                                  if (ue != null) {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pushNamed(
                                        HomePage.routeName,
                                        arguments: ue.UserName);
                                  } else {
                                    print("error");
                                  }
                                }
                              },
                              child: const Text(
                                'Submit',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have account?",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(SignUp.routeName);
                          },
                          child: const Text("Register Now"))
                    ],
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
