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
      body: Column(
        children: [
          Text('Email: ${bloc.email}'),
          Divider(),
          Text('Email: ${bloc.password}'),
        ],
      ),
    );
  }
}