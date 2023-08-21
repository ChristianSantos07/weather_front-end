import 'package:flutter/material.dart';
import 'home/screen_home.dart';




void main() {
  runApp(const MyApp());
  //runApp(MaterialApp(home: Container(color: Colors.amber,)));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      //home: const Login(),
      home: HomeScreen(),
    );
  }
}
