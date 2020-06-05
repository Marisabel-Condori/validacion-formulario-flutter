import 'dart:convert';

import 'package:validacion_de_formularios/src/model/productoModel.dart';
import 'package:http/http.dart' as http;

class ProductosProvider{

  final String _url = 'https://eventos-207fc.firebaseio.com';

  Future<bool> crearProducto(ProductoModel producto)async {
    final url = '$_url/producto.json';
    final res = await http.post(url, body: productoModelToJson(producto));
    final decodedData = json.decode(res.body);
    print(decodedData);
    return true;
  }
}