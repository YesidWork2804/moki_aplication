import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_parcial_1/estilos/Colores.dart';

class WidgetFovorite extends StatelessWidget {

  final bool estado;
  WidgetFovorite({required this.estado});

  @override
  Widget build(BuildContext context) {
    Colores _colores = new Colores();
    return Container(
          child:
          estado == true?
           Icon(Icons.favorite,color: Colors.red) : Icon(Icons.favorite_border),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white,
        ),
      );
  }
}