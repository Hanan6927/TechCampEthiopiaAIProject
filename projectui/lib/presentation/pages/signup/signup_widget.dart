import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projectui/presentation/pages/signin/signin_widget.dart';
import '../../../dataprovider/userRegister.dart';
import '../../../models/user_register.dart';
import '../home/home_widget.dart';

class SignUp extends StatefulWidget {
  static const String routeName = "/signup";
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

final emailController = TextEditingController();
final passwordController = TextEditingController();
final usernameController = TextEditingController();
final firstnameController = TextEditingController();
final lastnameController = TextEditingController();

class _SignUpState extends State<SignUp> {
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
                  padding: EdgeInsets.only(top: 110),
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
                            controller: usernameController,
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
                                labelText: 'Enter your Username',
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
                            controller: firstnameController,
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
                                labelText: 'Enter your First Name',
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
                            controller: lastnameController,
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
                                labelText: 'Enter your Last Name',
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
                                  var user = UserRegister(
                                      UserName: usernameController.text,
                                      Email: emailController.text,
                                      FirstName: firstnameController.text,
                                      LastName: lastnameController.text,
                                      Password: passwordController.text,
                                      ProfilePicture: null);
                                  RegisterProvider registerProvider =
                                      RegisterProvider(
                                          httpClient: http.Client());
                                  var ue = await RegisterProvider.registerUser(
                                      user: user);
                                  if (ue != null) {
                                    Navigator.of(context).pushNamed(
                                        SignIn.routeName,);
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
                        "Already registerd?",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(SignIn.routeName);
                          },
                          child: const Text("Login"))
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
