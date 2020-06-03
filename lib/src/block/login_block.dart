import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:validacion_de_formularios/src/block/validator.dart';

class LoginBloc with validator{
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // recuperamos datos del stream
  Stream<String> get emailStream => _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream => _passwordController.stream.transform(validarPassword);

  Stream<bool> get validacionDeFormulario =>
    Observable.combineLatest2(emailStream, passwordStream, (a, b) => true);

  String get email {return _emailController.value;}
  String get password {return _passwordController.value;}

  // insertar valores del stream
  Function (String) get changeEmail => _emailController.sink.add;
  Function (String) get changePassword => _passwordController.sink.add;

  dispose(){
    _emailController?.close();
    _passwordController?.close();
  }
}