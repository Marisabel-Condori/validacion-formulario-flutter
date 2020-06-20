import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:validacion_de_formularios/src/preferencias_usuario/preferenciasUsuario.dart';

class UsuarioProvider{
final _prefs = PreferenciasUsuario();


  Future<Map<String,dynamic>> loginProvider(String email, String password)async{

    final String _tokenFirebase = 'AIzaSyBiNp44oZ846px5BuyWnROZaqYqxH8jRbY';
    final authData = {
      'email'   : email,
      'password': password,
      'returnSecureToken': true,
    };
    final resp = await http.post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_tokenFirebase',
      body: json.encode(authData)
    );
    Map<String, dynamic> decodeResp = json.decode(resp.body);
    print(decodeResp);

    if(decodeResp.containsKey('idToken')){
      _prefs.token = decodeResp['idToken'];
      return {'ok':true, 'token': decodeResp['idToken']};
    }else{
      return {'ok':false, 'mensaje': decodeResp['error']['message']};
    }
  }
  
  Future<Map<String,dynamic>> nuevoUsuario(String email, String password)async{

    final String _tokenFirebase = 'AIzaSyBiNp44oZ846px5BuyWnROZaqYqxH8jRbY';
    final authData = {
      'email'   : email,
      'password': password,
      'returnSecureToken': true,
    };
    final resp = await http.post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_tokenFirebase',
      body: json.encode(authData)
    );
    Map<String, dynamic> decodeResp = json.decode(resp.body);
    print(decodeResp);

    if(decodeResp.containsKey('idToken')){
      _prefs.token = decodeResp['idToken'];
      return {'ok':true, 'token': decodeResp['idToken']};
    }else{
      return {'ok':false, 'mensaje': decodeResp['error']['message']};
    }
  }
}