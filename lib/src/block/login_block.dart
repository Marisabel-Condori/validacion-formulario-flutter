import 'dart:async';

import 'package:validacion_de_formularios/src/block/validator.dart';

class LoginBloc with validator{
  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  // recuperamos datos del stream
  Stream<String> get emailStream => _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream => _passwordController.stream.transform(validarPassword);

  // insertar valores del stream
  Function (String) get changeEmail => _emailController.sink.add;
  Function (String) get changePassword => _passwordController.sink.add;

  dispose(){
    _emailController?.close();
    _passwordController?.close();
  }
}