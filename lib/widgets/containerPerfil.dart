import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_parcial_1/estilos/Colores.dart';

class ContainerPerfil extends StatelessWidget {

  final String title;
  final String date;
  ContainerPerfil({required this.title, required this.date});

  @override
  Widget build(BuildContext context) {
    Colores colores = new Colores();

    return Container(
      child: Column(
        children: [
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: Color.fromRGBO(0, 0, 0, 0.51)),
          ),
          SizedBox(height: 5),
          Text(date,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        ],
      ),
      width: 80,
      height: 80,
      decoration: BoxDecoration(
          color: Color.fromRGBO(217, 217, 217, 42), borderRadius: BorderRadius.circular(10)),
    );
  }
}
