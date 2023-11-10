import 'package:flutter/material.dart';
import 'package:flutter_application_parcial_1/estilos/Colores.dart';
import 'package:flutter_application_parcial_1/providers/ui_provider.dart';
import 'package:flutter_application_parcial_1/providers/ui_provider_mascota.dart';
import 'package:provider/provider.dart';

class ButtonCategoria extends StatefulWidget {
  final nombre;
  final estado;
  ButtonCategoria({this.nombre,this.estado});

  @override
  State<ButtonCategoria> createState() => _ButtonCategoriaState();
}

class _ButtonCategoriaState extends State<ButtonCategoria> {
  Colores _colores = new Colores();
  


  @override
  Widget build(BuildContext context) {
    final _uiProvider = Provider.of<UiProviderMascota>(context);
    return  ElevatedButton(
      onPressed: (){
    
        // _uiProvider.selectedEstado = !_uiProvider.selectedEstado;

      },
        style: ElevatedButton.styleFrom(
      primary:  widget.estado == false ? _colores.buttonCategoria2 : _colores.buttonCategoria,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ) , child: Text(widget.nombre, style: TextStyle(color: widget.estado == false ? Color.fromRGBO(0, 0, 0, 0.5) : _colores.white, fontSize: 15),),
    );
  }
}
