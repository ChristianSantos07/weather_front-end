import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_linx/new/gerenciado_estado.dart';
import 'package:teste_linx/new/screen_home.dart';



final GetController get = Get.put(GetController());

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
