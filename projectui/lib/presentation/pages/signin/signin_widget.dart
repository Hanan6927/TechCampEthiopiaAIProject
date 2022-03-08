import 'package:flutter/material.dart';
import 'package:projectui/dataprovider/userRegister.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      //   Container(
      // decoration: BoxDecoration(
      // color: const Color(0xff7c94b6),
      // image: DecorationImage(
      //   fit: BoxFit.fitHeight,
      //   colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),
      //   image: const NetworkImage("https://www.journaljaeri.com/public/journals/37/homepageImage_en_US.jpg")
      // ),

      // ),
      // child: Text(" "),
      // ),

      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://www.journaljaeri.com/public/journals/37/homepageImage_en_US.jpg"),
              fit: BoxFit.fitHeight),
        ),
      ),
      Container(
        color: Color.fromARGB(75, 18, 190, 15),
      ),
      Container(
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 180),
              child: Center(
                // child: Text(
                //   'Welcome to',
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //       fontSize: 20.0, color: Color.fromRGBO(255, 255, 255, 1)),
                // ),
              ),
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
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2, color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2, color: Colors.white)),
                            hoverColor: Colors.white,
                            border: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2)),
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
                        style: const TextStyle(color: Colors.white),
                        obscureText: true,
                        decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2, color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2, color: Colors.white)),
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
                            padding:
                                MaterialStateProperty.all(const EdgeInsets.all(20)),
                          ),
                          onPressed: () async{
                            // Validate returns true if the form is valid, or false otherwise.
                            if (_formKey.currentState!.validate()) {
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   const SnackBar(content: Text('Processing Data')),
                              // );
                              // final userOrError = await RegisterProvider.signUp(UserRegister: UserRe
                              // );
                            }
                          },
                          child: const Text('Submit',style: TextStyle(color: Colors.black),),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Center(child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have account?",style: TextStyle(color: Colors.white),),
                TextButton(onPressed: (){}, child: const Text("Register Now"))
              ],
            ),)
          ],
        ),
      ),
    ]);
  }
}
