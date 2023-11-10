import 'package:flutter/material.dart';
import 'package:flutter_application_parcial_1/estilos/Colores.dart';
import 'package:flutter_application_parcial_1/models/models.dart';
import 'package:flutter_application_parcial_1/peticiones/peticiones_mascota.dart';
import 'package:provider/provider.dart';

import '../../providers/ui_provider.dart';


class ModificasMascotas extends StatefulWidget {
  final idperfil;
  final Mascota perfil;
  ModificasMascotas({required this.perfil, this.idperfil});

  @override
  _ModificasMascotasState createState() => _ModificasMascotasState();
}

class _ModificasMascotasState extends State<ModificasMascotas> {
  TextEditingController controlNombre = TextEditingController();
  TextEditingController controledad = TextEditingController();
  TextEditingController controlsexo = TextEditingController();
  TextEditingController controlcolor = TextEditingController();
  TextEditingController controlfoto = TextEditingController();
  TextEditingController controldescripcion = TextEditingController();


  @override
  void initState() {
    controlNombre = TextEditingController(text: widget.perfil.nombre);
    controledad = TextEditingController(text: widget.perfil.edad);
    controlsexo = TextEditingController(text: widget.perfil.sexo);
    controlcolor = TextEditingController(text: widget.perfil.color);
    controlfoto = TextEditingController(text: widget.perfil.foto);
    controldescripcion = TextEditingController(text: widget.perfil.descripcion);


    // controledad =
    //     TextEditingController(text: widget.perfil[widget.idperfil].edad.toString());
    // controledad =
    //     TextEditingController(text: widget.perfil[widget.idperfil].sexo);
    // controlsexo =
    //     TextEditingController(text: widget.perfil[widget.idperfil].color);
    // controlcolor =
    //     TextEditingController(text: widget.perfil[widget.idperfil].foto);
    // controlfoto =
    //     TextEditingController(text: widget.perfil[widget.idperfil].descripcion);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Colores _colores = new Colores();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _colores.ternary,
        title: Text("Mascota: " + widget.perfil.nombre),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: ListView(
            children: <Widget>[
              TextField(
                controller: controlNombre,
                decoration: InputDecoration(labelText: "Nombre"),
              ),
              TextField(
                controller: controledad,
                decoration: InputDecoration(labelText: "Edad"),
              ),
              TextField(
                controller: controlsexo,
                decoration: InputDecoration(labelText: "Sexo"),
              ),
              TextField(
                controller: controlcolor,
                decoration: InputDecoration(labelText: "Color"),
              ),
              TextField(
                controller: controlfoto,
                decoration: InputDecoration(labelText: "Foto"),
              ),
              TextField(
                controller: controldescripcion,
                decoration: InputDecoration(labelText: "Descripcion"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: _colores.ternary,
                ),
                child: Text("Modificar Mascota"),
                onPressed: () {
                                // print(widget.perfil.id);


                  editarMascota(
                      widget.idperfil,
                      controlNombre.text,
                      controledad.text,
                      controlsexo.text,
                      controlcolor.text,
                      controlfoto.text,
                      controldescripcion.text,
                      );
                       Navigator.pushNamed(context, 'homes');

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
