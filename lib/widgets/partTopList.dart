import 'package:flutter/material.dart';
import 'package:flutter_application_parcial_1/estilos/Colores.dart';

import 'button_categoria.dart';

class PartTopList extends StatefulWidget {
  String textBuscar;
  String tipo;

  PartTopList({required this.textBuscar,required this.tipo});

  @override
  State<PartTopList> createState() => _PartTopListState();

}

class _PartTopListState extends State<PartTopList> {
  @override
  Widget build(BuildContext context) {
    Colores colores = Colores();
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Text('MOKI ',
                    style: TextStyle(
                        color: colores.black2,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                Image.asset(
                  'assets/logoMoki.png',
                  width: 50,
                  height: 50,
                ),
              ],
            ),
            Image.asset(
              'assets/logoUsuario.png',
              width: 50,
              height: 50,
            ),
          ],
        ),
              SizedBox(height: 30),
        //barra de busqueda
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            //tamaño de la barra de busqueda
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                hintText: widget.textBuscar,
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: colores.buttonCategoria2,
                contentPadding: EdgeInsets.symmetric(horizontal: 20)),
          ),
        ),
        SizedBox(height: 20),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            height: 40.0,
            child: new ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                widget.tipo !='veterinaria'? 
                Row(
                  children: [
                    ButtonCategoria(nombre: 'Todo', estado: true),
                    SizedBox(width: 10),
                    ButtonCategoria(nombre: 'Perros', estado: false),
                    SizedBox(width: 10),
                    ButtonCategoria(nombre: 'Gatos', estado: false),
                    SizedBox(width: 10),
                    ButtonCategoria(nombre: 'Otros', estado: false),
                    SizedBox(width: 10),
                  ],
                ) : Container()
              ],
            )),
      ],
    );
  }
}
