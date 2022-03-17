import 'package:flutter/material.dart';
import 'package:projectui/presentation/constant.dart';
import 'package:projectui/presentation/pages/addImage/addImage.dart';
import 'package:projectui/presentation/pages/announcement/announce.dart';
import 'package:projectui/presentation/pages/home/home_widget.dart';
import 'package:projectui/presentation/pages/signin/signin_widget.dart';
import 'package:projectui/presentation/pages/signup/signup_widget.dart';
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(appBarTheme: AppBarTheme(backgroundColor: Colors.green)),
      debugShowCheckedModeBanner: false,
      initialRoute: SignIn.routeName,
      routes: {
        HomePage.routeName: (_) => const HomePage(),
        SignIn.routeName: (_) => const SignIn(),
        SignUp.routeName: (_) => const SignUp(),
        Announce.routeName:(_) => const Announce(),
        AddImage.routeName: (_) => const AddImage()
      },
      );
  }
}
class Router {
  
  static Route<dynamic> generateRoute(RouteSettings settings) {
    
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      // ignore: no_duplicate_case_values
      case signinRoute:
        return MaterialPageRoute(builder: (_) => const SignIn());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ),);
    }
  }
}

