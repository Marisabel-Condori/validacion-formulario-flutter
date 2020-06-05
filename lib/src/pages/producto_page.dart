import 'package:flutter/material.dart';
import 'package:validacion_de_formularios/src/utils/util.dart' as utils;

class ProductoPage extends StatelessWidget {

  final formkey = GlobalKey<FormState>();

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
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Form(
            key: formkey,
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
      validator: (value){
        if (value.length < 3 ) {
          return 'Ingrese nombre del producto';
        }else{
          return null;
        }
      },
    );
  }

  Widget _crearPrecio(){
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Precio',
      ),
      validator: (value){
        
        if (utils.isNumeric(value)) {
          return null;
        } else {
          return 'solo numeros';
        }
      },
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
      onPressed: _submit,
    );
  }

  void _submit(){
    if (!formkey.currentState.validate()) return;
    print('okkkkkkkkkk');
  }
}