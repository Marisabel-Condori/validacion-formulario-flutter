import 'package:flutter/material.dart';
import 'package:validacion_de_formularios/src/block/provider.dart';
import 'package:validacion_de_formularios/src/pages/home_page.dart';
import 'package:validacion_de_formularios/src/pages/login_page.dart';
import 'package:validacion_de_formularios/src/pages/producto_page.dart';
import 'package:validacion_de_formularios/src/pages/registro_page.dart';
import 'package:validacion_de_formularios/src/preferencias_usuario/preferenciasUsuario.dart';
 
void main() async{ 
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();

  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuario();
    print(prefs.token);
    return Provider(
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'login',
      routes: {
        '/' : (BuildContext context) => HomePage(),
        'login' : (BuildContext context) => LoginPage(),
        'registro' : (BuildContext context) => RegistroPage(),
        'producto' : (BuildContext context) => ProductoPage(),
      },
      theme: ThemeData(
        primaryColor: Colors.deepPurple
      )
      ),
    );
    
  }
}