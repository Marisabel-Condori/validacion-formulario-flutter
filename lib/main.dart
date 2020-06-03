import 'package:flutter/material.dart';
import 'package:validacion_de_formularios/src/pages/home_page.dart';
import 'package:validacion_de_formularios/src/pages/login_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'login',
      routes: {
        '/' : (BuildContext context) => HomePage(),
        'login' : (BuildContext context) => LoginPage(),
      },
    );
  }
}