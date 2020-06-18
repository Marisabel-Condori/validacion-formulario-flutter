import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:validacion_de_formularios/src/model/productoModel.dart';
import 'package:validacion_de_formularios/src/provider/productos_provider.dart';
import 'package:validacion_de_formularios/src/utils/util.dart' as utils;

class ProductoPage extends StatefulWidget {

  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  final formkey = GlobalKey<FormState>();
  final scafooldkey = GlobalKey<ScaffoldState>();
  final productoProvder = ProductosProvider();
  ProductoModel producto = ProductoModel();
  bool _guardando = false;
  File foto;

  @override
  Widget build(BuildContext context) {
    
    final ProductoModel prodData = ModalRoute.of(context).settings.arguments;
    if (prodData != null) {
      producto = prodData;
    }

    return Scaffold(
      key: scafooldkey,
      appBar: AppBar(
        title: Text('Producto'),
        actions: [
          IconButton(icon: Icon(Icons.image), onPressed: _seleccionarFoto),
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
                _mostrarFoto(),
                _crearProducto(),
                _crearPrecio(),
                _crearDisponible(),
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
      initialValue: producto.titulo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Nombre Producto',
      ),
      onSaved: (value) => producto.titulo = value,
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
      initialValue: producto.valor.toString(),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Precio',
      ),
      onSaved: (value) => producto.valor = int.parse(value),
      validator: (value){
        if (utils.isNumeric(value)) {
          return null;
        } else {
          return 'solo numeros';
        }
      },
    );
  }

  Widget _crearDisponible(){
    return SwitchListTile(
      title: Text('Disponible'),
      value: producto.disponible, 
      activeColor: Colors.deepPurple,
      onChanged: ((value){
        setState(() {
          producto.disponible = value;
        });
      })
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
      onPressed: (_guardando)?null: _submit,
    );
  }

  void _submit(){
    if (!formkey.currentState.validate()) return;
    formkey.currentState.save();
    _guardando = true;
    setState(() { });
    if (producto.id == null) {
      productoProvder.crearProducto(producto);
    } else {
      productoProvder.editarProducto(producto);
    }
    mostrarSnackBar('Guardado exitosamente');
    Navigator.pop(context);
  }

  void mostrarSnackBar(String mensaje){
    final snackbar = SnackBar(
      content: Text(mensaje),
      duration: Duration(milliseconds: 3000),
    );
    scafooldkey.currentState.showSnackBar(snackbar);
  }

  _mostrarFoto(){
    if(producto.fotoUrl != null){
      return Container();
    }else{
      return Image(
        image: AssetImage(foto?.path?? 'assets/no-image.png'),
        height: 300.0,
        fit: BoxFit.cover,
      );
    }
  }

  _seleccionarFoto()async{
    foto = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (foto != null) {
      
    }
    setState(() {  });
  }
}