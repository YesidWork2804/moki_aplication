import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_parcial_1/models/models.dart';
import 'package:flutter_application_parcial_1/pages/mascota/perfilMascota.dart';
import 'package:flutter_application_parcial_1/providers/ui_provider_mascota.dart';
import 'package:flutter_application_parcial_1/widgets/widget_favorite.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../estilos/Colores.dart';
import '../../peticiones/peticiones_mascota.dart';
import '../../widgets/partTopList.dart';
import 'adicionarMascota.dart';

class ListaMascotas extends StatefulWidget {
  ListaMascotas({required this.title});
  final String title;

  @override
  _ListaMascotasState createState() => _ListaMascotasState();
}

@override
void initState() {
  initState();
}

class _ListaMascotasState extends State<ListaMascotas> {
  @override
  Widget build(BuildContext context) {
    Colores colores = new Colores();

    return Scaffold(
      backgroundColor: colores.white,
      body: getInfo(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AgregarMascota()))
                .then((value) {
              setState(() {
                getInfo(context);
              });
            });
          });
        },
        tooltip: 'Refrescar',
        child: Icon(Icons.add),
        backgroundColor: colores.ternary,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Widget getInfo(BuildContext context) {
  return FutureBuilder(
    future: listarPost(http
        .Client()), //En esta línea colocamos el el objeto Future que estará esperando una respuesta
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      switch (snapshot.connectionState) {

        //En este case estamos a la espera de la respuesta, mientras tanto mostraremos el loader
        case ConnectionState.waiting:
          return Center(child: CircularProgressIndicator());

        case ConnectionState.done:
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          // print(snapshot.data);
          return snapshot.data != null
              ? VistaMascota(mascotas: snapshot.data)
              : Text('Sin Datos');

        /*
            */
        default:
          return Text('Presiona el boton para recargar');
      }
    },
  );
}

class VistaMascota extends StatefulWidget {
  final List<Mascota> mascotas;
  const VistaMascota({required this.mascotas});

  @override
  State<VistaMascota> createState() => _VistaMascotaState();
}

class _VistaMascotaState extends State<VistaMascota> {
  @override
  Widget build(BuildContext context) {
    final _uiProvider = Provider.of<UiProviderMascota>(context);

    Colores colores = new Colores();
    return Column(
      children: [
        PartTopList(textBuscar: 'Buscar Mascotas',tipo: ''),
        Expanded(
          child: GridView.builder(
              itemCount: widget.mascotas.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => PerfilMascota(
                                  perfil: widget.mascotas[index],
                                  // idperfil: mascotas[index].id,
                                ))).then((value) => () {
                          setState(() {
                            getInfo(context);
                          });
                          getInfo(context);
                        });
                    // print(mascotas[index].id);
                  },
                  child: Container(
                      margin: EdgeInsets.all(10),
                      height: 200,
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: colores
                              .getColor()[index % colores.getColor().length],
                          elevation: 1,
                          child: Stack(clipBehavior: Clip.none, children: [

                            CircleAvatar(
                                radius: 80.0,
                                backgroundColor: Colors.white,
                                backgroundImage:
                                    FileImage(File(widget.mascotas[index].foto))
                                ),

                            Positioned(
                              top: 10,
                              right: 10,
                              child: WidgetFovorite(
                                estado: true,
                              ),
                            ),
                            Positioned(
                              //colocar car abajo
                              top: 138,
                              child: Container(
                                height: 55,
                                width: 169,
                                child: Card(
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(widget.mascotas[index].nombre,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)),
                                        Text(widget.mascotas[index].edad,
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal)),
                                        // ListTile(
                                        // ),
                                      ],
                                    ),
                                  ),
                                  margin: EdgeInsets.all(0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                              ),
                            )
                          ]))),
                ));
              }),
        )
      ],
    );
  }
}
