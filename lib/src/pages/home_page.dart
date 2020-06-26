import 'package:flutter/material.dart';
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
          final productos = snapshot.data;
          return ListView.builder(
            itemCount: productos.length,
            itemBuilder: (context, i) => _crearItem(context, productos[i])
          );
        }else{
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearItem(BuildContext context, ProductoModel producto){
    return Dismissible(
      key: UniqueKey(),
      background: Container(color: Colors.deepPurple),
      child: Card(
        child: Column(
          children: [
            (producto.fotoUrl == null)
            ? Image(image: AssetImage('assets/no-image.png'))
            : FadeInImage(
              placeholder: AssetImage('assets/no-image.png'), 
              image: NetworkImage(producto.fotoUrl),
              height: 300.0,
              width: double.infinity,
              fit: BoxFit.cover,
              ),
             ListTile(
              title: Text('${producto.titulo} - ${producto.valor}'),
              subtitle: Text(producto.id),
          
              onTap: () => Navigator.pushNamed(context, 'producto', arguments: producto),
            ),
          ],
        ),
      ),
      onDismissed: (direction) {
        productosProvider.borrarProducto(producto.id);
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