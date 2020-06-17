import 'dart:convert';

import 'package:validacion_de_formularios/src/model/productoModel.dart';
import 'package:http/http.dart' as http;

class ProductosProvider{

  final String _url = 'https://eventos-207fc.firebaseio.com';
  final List<ProductoModel> productos = new List<ProductoModel>();

  Future<bool> crearProducto(ProductoModel producto)async {
    final url = '$_url/producto.json';
    final res = await http.post(url, body: productoModelToJson(producto));
    final decodedData = json.decode(res.body);
    print(decodedData);
    return true;
  }

  Future<List<ProductoModel>> cargarProductos() async{
    final url = '$_url/producto.json';
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    print('**********DECODED DATA**********');
    print(decodedData);
    if (decodedData == null) return [];
    decodedData.forEach((id, prod){
      print('***********for each**************');
      final prodTemp = ProductoModel.fromJson(prod);
      prodTemp.id = id;
      productos.add(prodTemp);
    });
    print(productos);
    return productos;
    
  }


}