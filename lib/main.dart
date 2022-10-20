import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sewana/signin.dart';
import 'package:sewana/sizeconfig.dart';
import 'package:sewana/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   //SizeConfig().init(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const SignIn(),
      // home: AnimatedSplashScreen(
      //   splashIconSize:350, 
      //   curve: Curves.ease,
      //  // splash:Icon(Icons.pets,color: Colors.black45,),
      //  splash: Image.asset(
      //    'assets/Sewana.png',
        
      //    ),
      // duration: 4000,
      // nextScreen: const SignIn()),
    );
  }
}



