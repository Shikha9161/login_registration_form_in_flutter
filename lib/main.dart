import 'package:flutter/material.dart';
import 'package:shikha_demo1/view/screens/login_screen.dart';
import 'package:shikha_demo1/view/screens/signup_screen.dart';

 main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),

    );
  }
}
