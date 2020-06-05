import 'package:flutter/material.dart';

class ProductoPage extends StatelessWidget {
  const ProductoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Producto'),
        actions: [
          IconButton(icon: Icon(Icons.image), onPressed: (){}),
          IconButton(icon: Icon(Icons.camera_alt), onPressed: (){}),
        ],
      ),
      body: Container(),
    );
  }
}