import 'dart:convert';
import 'dart:io';

import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';
import 'package:validacion_de_formularios/src/model/productoModel.dart';
import 'package:http/http.dart' as http;
import 'package:validacion_de_formularios/src/preferencias_usuario/preferenciasUsuario.dart';

class ProductosProvider{

  final _prefs = new PreferenciasUsuario();
  final String _url = 'https://eventos-207fc.firebaseio.com';
  final List<ProductoModel> productos = new List<ProductoModel>();

  Future<bool> crearProducto(ProductoModel producto)async {
    final url = '$_url/producto.json?auth=${_prefs.token}';
    final res = await http.post(url, body: productoModelToJson(producto));
    final decodedData = json.decode(res.body);
    print(decodedData);
    return true;
  }

  Future<bool> editarProducto(ProductoModel producto)async {
    final url = '$_url/producto/${producto.id}.json?auth=${_prefs.token}';
    final res = await http.put(url, body: productoModelToJson(producto));
    final decodedData = json.decode(res.body);
    print(decodedData);
    return true;
  }

  Future<List<ProductoModel>> cargarProductos() async{
    final url = '$_url/producto.json?auth=${_prefs.token}';
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    if (decodedData == null) return [];
    decodedData.forEach((id, prod){
      final prodTemp = ProductoModel.fromJson(prod);
      prodTemp.id = id;
      productos.add(prodTemp);
    });
    print('*************PRODUCTOS*****************');
    print(productos);
    return productos;
  }


  Future<int> borrarProducto(String id)async{
    final url = '$_url/producto/$id.json?auth=${_prefs.token}';
    final resp = await http.delete(url);
    print(resp.body);
    return 1;
  }


  Future<String> subirImagen(File imagen)async{
    final url = Uri.parse('https://api.cloudinary.com/v1_1/dypifgbw7/image/upload?upload_preset=szffpgf0');
    final mimeType = mime(imagen.path).split('/');//imagen/jpg
    final imagenUploadRequest = http.MultipartRequest('POST', url );
    final file = await http.MultipartFile.fromPath('file', imagen.path,
    contentType: MediaType(mimeType[0], mimeType[1])
    );
    imagenUploadRequest.files.add(file);
    final streamResponse = await imagenUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);
    if(resp.statusCode != 200 && resp.statusCode != 201){
      print('Algo  salio mal');
      print(resp.body);
      return null;
    }
    final respData = json.decode(resp.body);
    print('**********************resp data*************************** cargar foto*********');
    print(respData);
    return respData['secure_url'];
  }


}