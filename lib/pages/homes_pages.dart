import 'package:flutter/material.dart';
import 'package:flutter_application_parcial_1/pages/adopciones/adopciones_pages.dart';
import 'package:flutter_application_parcial_1/pages/donaciones/donaciones_pages.dart';
import 'package:flutter_application_parcial_1/pages/mascota/lista_mascota.dart';
import 'package:flutter_application_parcial_1/pages/veterinaria/veterinaria_pages.dart';
import 'package:provider/provider.dart';

import '../estilos/Colores.dart';
import '../providers/ui_provider.dart';
import '../widgets/boton_inferior.dart';
import '../widgets/widget_Iniciar.dart';

class HomePages extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    return Scaffold(
    body: _HomePageBody(),

    // bottomNavigationBar: ButtomNavigationBar(),
      // floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    bottomNavigationBar: uiProvider.selectedMenuOpt==0 || uiProvider.selectedMenuOpt==1 ?   null : BarraInferion(),
  );
  }
}

class _HomePageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    //obtener el selects menu opt
    final uiProvider = Provider.of<UiProvider>(context);
    Colores _colores = Colores();


    //Cambiar para mostrar la pagina respectiva
    final currentIndex = uiProvider.selectedMenuOpt;

    switch(currentIndex){

      case 0: return
      WidgetIniciar(
          tituloPages: 'MOKI',
          imagen: 'assets/imgLogin.png',
          textBoton: 'Registrarme',
          colorprimary: _colores.primary,
          colorSecondary: _colores.black,
          tituloFormulario: 'Registrarse',
          textInferior: '¿No tienes una cuenta aun?',
          textInferiorButton: 'Iniciar Sesion',
          // funcionButton: fuctionButtonIniciar,
        );
        // return ListACtivityPage();

      case 1:    return WidgetIniciar(
          tituloPages: 'ADOPTA UN AMIGO',
          imagen: 'assets/imgLogin2.png',
          textBoton: 'Iniciar  Sesion',
          colorprimary: _colores.primary,
          colorSecondary: _colores.black,
          tituloFormulario: 'Iniciar Sesion',
          textInferior: '¿No tienes una cuenta aun?',
          textInferiorButton: ' Registrate',
          // funcionButton: fuctionButtonRegistrarse,
        );
        // return ListTaskPage();

      case 2:
        return ListaMascotas(title: '',);

      case 3:
      return AdopcionesPage();
      case 4:
      return DonacionesPage();
      case 5:
      return VeterinariaPage();

      case 5:
      return HomePages();



      default: 
        return WidgetIniciar(
          tituloPages: 'ADOPTA UN AMIGO',
          imagen: 'assets/imgLogin2.png',
          textBoton: 'Iniciar  Sesion',
          colorprimary: _colores.primary,
          colorSecondary: _colores.black,
          tituloFormulario: 'Iniciar Sesion',
          textInferior: '¿No tienes una cuenta aun?',
          textInferiorButton: ' Registrate',
          // funcionButton: fuctionButtonRegistrarse,
        );
    }
  }
     void fuctionButtonRegistrarse(BuildContext context){
      final uiProvider = Provider.of<UiProvider>(context);
      uiProvider.selectedMenuOpt==0;
    }
      void fuctionButtonIniciar(BuildContext context){
        final uiProvider = Provider.of<UiProvider>(context);
      uiProvider.selectedMenuOpt==1;
      // Navigator.pushNamed(context, 'homes');
    }
}