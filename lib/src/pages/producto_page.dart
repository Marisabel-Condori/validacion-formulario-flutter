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
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            child: Column(
              children: [
                _crearProducto(),
                _crearPrecio(),
                _crearBoton()
              ],
              
            )
          ),
        ),
      ),
    );
  }

  Widget _crearProducto(){
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Nombre Producto',
      ),
    );
  }

  Widget _crearPrecio(){
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Nombre Producto',
      ),
    );
  }

  Widget _crearBoton(){
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      ),
      color: Colors.deepPurple,
      textColor: Colors.white,
      label: Text('Guardar'),
      icon: Icon(Icons.save),
      onPressed: (){},
    );
  }
}