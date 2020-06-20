import 'package:flutter/material.dart';
import 'package:validacion_de_formularios/src/block/provider.dart';
import 'package:validacion_de_formularios/src/provider/usuario_provider.dart';

class LoginPage extends StatelessWidget {
  final usuarioProvider = new UsuarioProvider();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          _crearFondo(context),
          _crearFormulario(context)
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

  Widget _crearFormulario(BuildContext context){
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size; 
    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(child: Container(
            height: 150.0  )
          ),
          Container(
            width: size.width*0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 3.0
                )
              ],
            ),
            
            child: Column(
              children: [
                Text('Ingreso'),
                SizedBox(height: 60.0),
                _crearEmail(bloc),
                SizedBox(height: 20.0),
                _crearPassword(bloc),
                SizedBox(height: 20.0),
                _crearBoton(bloc),
                
              ],
            ),
          ),
          FlatButton(
            child: Text('Crear cuenta'),
            onPressed: () => Navigator.pushReplacementNamed(context, 'registro'),
          ),
          SizedBox(height: 100.0),
        ],
      ),
    );
  }

  Widget _crearEmail(LoginBloc bloc){
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext conxtext, AsyncSnapshot snapshot){
        return Container(
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(Icons.alternate_email, color: Colors.deepPurple),
              labelText: 'Email',
              hintText: 'ejemplo@gmail.com', 
              counterText: snapshot.data,
              errorText: snapshot.error
            ),
            onChanged: bloc.changeEmail,
          ),
          
        );
      }
    );
  }

  Widget _crearPassword(LoginBloc bloc){
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext conxtext, AsyncSnapshot snapshot){
        return Container(
          child: TextField(
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(Icons.lock_outline, color: Colors.deepPurple),
              labelText: 'Password',
              counterText: snapshot.data,
              errorText: snapshot.error
            ),
            onChanged: bloc.changePassword,
          ),
        );
      }
    );
  }

  Widget _crearBoton(LoginBloc bloc){
    return StreamBuilder(
      stream: bloc.validacionDeFormulario,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
            child: Text('ingresar')
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)
          ),
          elevation: 0.0,
          color: Colors.deepPurple,
          textColor: Colors.white,
          onPressed: snapshot.hasData?  () => _agarrarDatos(context, bloc)  :  null
        );
      }
    );
  }
  

  _agarrarDatos(BuildContext context ,LoginBloc bloc){
    usuarioProvider.loginProvider(bloc.email, bloc.password);

    // Navigator.pushReplacementNamed(context, '/');
  }
}