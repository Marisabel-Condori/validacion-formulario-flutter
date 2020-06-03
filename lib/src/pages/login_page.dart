import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _crearFondo(context)
          
        ],
      ),
    );
  }

  Widget _crearFondo(BuildContext context){
    final size = MediaQuery.of(context).size;

    final fondoMorado = Container(
      width: double.infinity,
      height: size.height*0.4,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(63, 63, 156, 1.0),
            Color.fromRGBO(90, 70, 178, 1.0),    
        ])
      ),
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.05),
      ),
    );

    return Stack(
      children: [
        fondoMorado,
        Positioned(child: circulo, left: 30.0, top: 90.0,),
        /**********************************************/
    //    Positioned(child: circulo, right: 10.0, bottom: 20.0,),
      //  Positioned(child: circulo, bottom: -50.0, right: -10.0,),
    //    Positioned(child: circulo, left: 30.0, top: -10.0,),
    /**********************************************/
        Container(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(   
            children: [
              Icon(Icons.person_pin_circle, color: Colors.white, size: 50.0,),
              SizedBox(width: double.infinity),
              Text('Mari', style: TextStyle(color: Colors.white, fontSize: 30.0),),
            ],
          ),
        )
      ],
    );
  }

  
}