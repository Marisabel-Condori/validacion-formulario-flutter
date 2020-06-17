import 'package:flutter/material.dart';
import 'package:validacion_de_formularios/src/block/provider.dart';
import 'package:validacion_de_formularios/src/model/productoModel.dart';
import 'package:validacion_de_formularios/src/provider/productos_provider.dart';

class HomePage extends StatelessWidget {
  final productosProvider = ProductosProvider();

  @override
  Widget build(BuildContext context) {

  //  final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home page')
      ),
      body: _crearListado(),
      floatingActionButton: _crearProducto(context),
    );
  }

  Widget _crearListado(){
    return FutureBuilder(
      future: productosProvider.cargarProductos(),
      builder: (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot) {
        if(snapshot.hasData){
          print('************');
          print(snapshot.data);
          return Container();
        }else{
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearProducto(BuildContext context){
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: () => Navigator.pushNamed(context, 'producto')
    );
  }
}