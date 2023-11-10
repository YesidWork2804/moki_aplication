

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../estilos/Colores.dart';
import '../models/models.dart';
import '../providers/ui_provider.dart';

  class WidgetIniciar extends StatefulWidget {
  String value='';
  static String id = 'login_page';

  final tituloPages;
  final tituloFormulario;
  final tituloBoton;

  final textBoton;
  final textInferior;
  final textInferiorButton;

  final imagen;
  final colorprimary;
  final colorSecondary;

  // final funcionButton;

  WidgetIniciar({
      this.tituloPages,
      this.imagen,
      this.textBoton,
      this.colorprimary,
      this.colorSecondary,
      this.tituloFormulario,
      this.tituloBoton,
      this.textInferior,
      this.textInferiorButton,
      // this.funcionButton,
    });

    @override 
    WidgetIniciarState createState() => WidgetIniciarState();
  }
  
  class WidgetIniciarState extends State<WidgetIniciar> {
    late Usuario usuario;
    Colores _colores = Colores();


    @override
    void dispose() {
      // Limpia el controlador cuando el Widget se descarte
      myControllerUsuario.dispose();
      myControllerClave.dispose();
      super.dispose();
    }

    @override
    Widget build(BuildContext context) {

        final uiProvider = Provider.of<UiProvider>(context);

      return SafeArea(
        child: Scaffold(

          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: <Color>[
                  widget.colorprimary,
                  widget.colorSecondary,
                ],
              )
            ),
            child: Center( 
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.tituloPages == 'Null' ? 'Iniciar Sesion' : widget.tituloPages,
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Flexible(
                    child:
                    Padding(
                      padding: const EdgeInsets.only(left:50),
                      child: Image.asset(widget.imagen),
                    ),
                  ), 
                  Container(///
                    padding: EdgeInsets.all(20.0),
                    width: 320,
                    height: 381,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                    SizedBox(height: 15.0,),
                    Text(
                      widget.tituloFormulario == null ? 'Iniciar Sesion' : widget.tituloFormulario ,style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),
                    SizedBox(height: 30.0,),
                    _userTextField(),
                    SizedBox(height: 20,),
                    _passwordTextField(),
                    SizedBox(height: 20.0,),
                    _bottonLogin(),
                    SizedBox(height: 20.0,),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(widget.textInferior,style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.w400)),
                        GestureDetector(
                          onTap: () {

                            if(uiProvider.buttonProvider=='Registrate'){
                                uiProvider.buttonProvider = 'Iniciar Sesion';
                                uiProvider.selectedMenuOpt = 0;
                            }
                            if (widget.textInferiorButton == 'Iniciar Sesion') {
                                uiProvider.buttonProvider = 'Registrate';
                                uiProvider.selectedMenuOpt = 1;
                            }

                          },
                          child: Text(widget.textInferiorButton ,style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.w900))),

                      ],
                    ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }

 Widget _userTextField() {
   return StreamBuilder(
     builder: (BuildContext context, AsyncSnapshot snapshot){
       return Container(
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(20.0),
         ),
         width: 283,
         child: TextField(
           controller: myControllerUsuario,
           keyboardType: TextInputType.emailAddress ,
           decoration: InputDecoration(
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide.none,
              ),
              fillColor:  Color.fromRGBO(196, 196, 196, 0.4),
             border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none),
              hintText: 'Usuario',
           ),
           onChanged: (value){
           },
         ),
       );
     }
   );
 }

  Widget _passwordTextField() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(20.0),
         ),
          width: 283,
          child: TextField(
            //color de fondo
            controller: myControllerClave,
            keyboardType: TextInputType.number ,
            obscureText: true,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor:  Color.fromRGBO(196, 196, 196, 0.4),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none),
              hintText: '********',
            ),
            onChanged: (value){
            },
          )
        ); 
     }
    );
  }

  Widget _bottonLogin() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot){
        final uiProvider = Provider.of<UiProvider>(context);
        
        return RaisedButton(
          child: Container(
            width: 283,
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: Center(
              child: Text(
                widget.textBoton== null ? 'Iniciar Sesion' : widget.textBoton,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold, 
                ),
              ),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 10.0,
          color: _colores.colorButton,
          onPressed: (){

            if(uiProvider.buttonProvider == 'Registrate'){
              // print('registro');
              if (myControllerUsuario.text.toString()=='' && myControllerClave.text.toString()=='') {
                _showMyDialog('Ingrese las Credenciales');
              }else{
                if (myControllerUsuario.text.toString()=='admin' && myControllerClave.text.toString()=='123') {

                    uiProvider.selectedMenuOpt=2;
                  _limpiar();
                }else{
                  _showMyDialog('Credenciales Incorrectass');
                }
              }

            }else{
                _showMyDialog('Usuario Registrado');
            }


          } 
        );
      }
    );
  }

  Future<void> _limpiar() async {
    myControllerUsuario.text= '';
    myControllerClave.text= '';
  }

  Future<void> _showMyDialog(String mensaje) async {
    myControllerUsuario.clear();
    myControllerClave.clear();
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(mensaje),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

} final myControllerUsuario  = TextEditingController(), myControllerClave = TextEditingController();