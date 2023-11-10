import 'package:flutter/material.dart';

class Colores{
  final Color primary = Color(0xFF8B2AAD);
  final Color secondary  = Color(0xFFBF95D2);

  final Color colorButton  = Color(0xFF586EE4);
  final Color cuaternary = Color(0xFFC4C4C4);
  final Color ternary = Color(0xFFF49191);
  final Color quinary = Color(0xFFF77CFD4);

final Color black = Color(0xFFFFFFF);
final Color black2 = Color.fromARGB(255, 0, 0, 0);

//color blanco
final Color white = Colors.white;

  final Color buttonCategoria = Color(0xFF586EE4);
  final Color buttonCategoria2 = Color(0xFFECEEFB);

//Colores Pagina Adopciones
// #40000000
  final Color borderTarjeta = Color.fromARGB(179, 209, 209, 209);
  final Color edadMascota = Color.fromARGB(255, 102, 102, 102);

//Colores Pagina Donaciones
  
 
  final Color fondoTarjeta = Color.fromARGB(167, 161, 161, 161);

  

  getColor() {
  final Color color_1 = Color(0xFFF49191);
  final Color color_2 = Color(0xFF77CFD4);
  final Color color_3 = Color(0xFFAC8AF4);
  final Color color_4 = Color(0xFFEFF239);

    //retornar lista de colores
    List<Color> list = [color_1, color_2, color_3, color_4];
    //retronar una lista de colores  que cuando llegue al final del listado regrese al principio
    // print(TaskProvider().listTasks.length);
    print(list.length);
    return list;
  }
}
