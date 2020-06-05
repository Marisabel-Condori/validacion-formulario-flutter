import 'package:flutter/material.dart';
import 'package:validacion_de_formularios/src/block/provider.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page')
      ),
      body: Container(),
      floatingActionButton: _crearProducto(context),
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