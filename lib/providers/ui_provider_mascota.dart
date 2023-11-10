
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class UiProviderMascota extends ChangeNotifier {
  int selectedCategoria = 0;
  bool estado = true;
  String edadFecha ='Seleccionar edad de la Mascota';
  String genero = 'Masculino';

  set selectedEdadFecha( String i ){
    this.edadFecha = i;
    notifyListeners();
  }


  String get selectedEdadFecha {
    return this.edadFecha;
  }

  String get selectdGenero {
    return this.genero;
  }

  set sexosList(String genero) {
    this.genero = genero;
    notifyListeners();
  }

  bool get selectedEstado {
    return this.estado;
  }

  set selectedEstado( bool i ){
    this.estado = i;
    notifyListeners();
  }

  int get selectedMenuOptCategoria {
    return this.selectedCategoria;
  }

  set selectedMenuOptCategoria( int i ){
    this.selectedCategoria = i;
    notifyListeners();
  }
}