
import 'package:flutter/material.dart';
import '../estilos/Colores.dart';
import '../widgets/widget_Iniciar.dart';

  class LoginPage extends StatefulWidget {
    @override 
    _LoginPageState createState() => _LoginPageState();
  }
  
  class _LoginPageState extends State<LoginPage> {
    Colores _colores = Colores();

    @override
    void dispose() {
      // Limpia el controlador cuando el Widget se descarte
      super.dispose();
    }

    @override
    Widget build(BuildContext context) {
      return SafeArea(
        child: WidgetIniciar(
          tituloPages: 'INICIAR SESION',
          imagen: 'assets/imgLogin2.png',
          textBoton: 'Iniciar  Sesion',
          colorprimary: _colores.primary,
          colorSecondary: _colores.black,
          tituloFormulario: 'Iniciar Sesion',
          textInferior: '¿No tienes una cuenta aun?',
          textInferiorButton: ' Registrate',
        )
      );
    }
    void fuctionButton(){
      Navigator.pushNamed(context, 'homes');
    }
}