import 'package:flutter/material.dart';
import 'package:flutter_application_parcial_1/models/models.dart';
import 'package:flutter_application_parcial_1/pages/homes_pages.dart';
import 'package:flutter_application_parcial_1/pages/mascota/lista_mascota.dart';
import '../../estilos/Colores.dart';
import '../../peticiones/peticiones_mascota.dart';
import '../../widgets/containerPerfil.dart';
import 'modificarMascota.dart';

var contextoppal;

class PerfilMascota extends StatefulWidget {
  // final int idperfil;
  final Mascota perfil;
  PerfilMascota({required this.perfil});

  @override
  State<PerfilMascota> createState() => _PerfilMascotaState();
}

class _PerfilMascotaState extends State<PerfilMascota> {
  Colores colores = new Colores();

  @override
  Widget build(BuildContext context) {
    contextoppal = context;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Perfil',
      home: Scaffold(
        // appBar: AppBar(
        //   //boton retroceder
        //   // leading: IconButton(
        //   //   icon: Icon(Icons.arrow_back),
        //   //   onPressed: () {
        //   //     Navigator.pop(context);
        //   //   },
        //   // ),
        //   backgroundColor: colores.ternary,
        //   title: Text('Perfil Mascota'),
        //   actions: [
        //     IconButton(
        //         tooltip: 'Editar Mensajero',
        //         icon: Icon(Icons.edit),
        //         onPressed: () {
        //           Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                   builder: (BuildContext context) => ModificasMascotas(
        //                       perfil: widget.perfil,
        //                       idperfil: int.parse(widget.perfil.id))));
        //         }),
        //     IconButton(
        //         tooltip: 'Eliminar Mensajero',
        //         icon: Icon(Icons.delete),
        //         onPressed: () {
        //           // print(widget.idperfil);
        //           // print(int.parse(widget.perfil.id));
        //           confirmaeliminar(context, int.parse(widget.perfil.id));
        //         })
        //   ],
        // ),
        body: ListView(children: [
          Container(
            child: Card(
              color: colores.ternary,
              elevation: 1,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.network(widget.perfil.foto),
                  GestureDetector(
                      onTap: (() {
                        Navigator.pop(context);
                      }),
                      child: Container(
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 40,
                          ),
                          padding: EdgeInsets.only(top: 20, left: 20))),
                  Positioned(
                    right: 40,
                    child: GestureDetector(
                      onTap: () {
                        print('hola');
                      },
                      child: IconButton(
                          tooltip: 'Editar Mensajero',
                          icon: Icon(
                            Icons.edit,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ModificasMascotas(
                                            perfil: widget.perfil,
                                            idperfil:
                                                int.parse(widget.perfil.id)))).then((value) => setState(() {
                                                  // getInfo(context);
                                                }));
                                                // getInfo(context);
                          }),
                    ),
                  ),
                  Positioned(
                    right: 5,
                    child: IconButton(
                        tooltip: 'Eliminar Mensajero',
                        icon: Icon(Icons.delete, size: 30),
                        onPressed: () {
                          // print(widget.idperfil);
                          print(int.parse(widget.perfil.id));
                          confirmaeliminar(
                              context, int.parse(widget.perfil.id));
                        }),
                  ),
                  Positioned(
                    //colocar car abajo
                    top: 318,
                    child: Container(
                      height: 485,
                      width: 385,
                      child: Card(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(widget.perfil.nombre,
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold)),
                                        Text(widget.perfil.descripcion,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.normal)),
                                        // ListTile(
                                        // ),
                                      ],
                                    ),
                                    Image.asset(
                                      'assets/logoDonar.png',
                                      height: 80,
                                      width: 80,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ContainerPerfil(
                                      title: 'Edad',
                                      date: widget.perfil.edad,
                                    ),
                                    ContainerPerfil(
                                      title: 'Sexo',
                                      date: widget.perfil.sexo,
                                    ),
                                    ContainerPerfil(
                                      title: 'Color',
                                      date: widget.perfil.color,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                  // Expanded(
                                  //     child: Image.asset(
                                  //       'assets/logoUsuarioInfo.png',
                                  //     ),
                                  // ),
                                SizedBox(
                                  height: 100,
                                ),
                                Expanded(
                                  child: Text(
                                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.and typesetting industry.and typesetting industry. Lorem  the 1500s,',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                  Image.asset(
                                    'assets/logoPatrocinar.png',
                                    width: 130,
                                  ),
                                  SizedBox(width: 10),
                                  Image.asset(
                                    'assets/logoAdoptar.png',
                                    height: 44,
                                    width: 130,
                                  ),

                                  ],
                                ),
                                
                              ],
                            ),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 440,
                    left: 100,
                  child: Image.asset(
                    'assets/logoUsuarioInfo.png',
                    height: 300,
                    width: 300,

                  ),
                ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ]),
      ),
    );
  }

  void confirmaeliminar(context, int ideliminar) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text('Realmente Desea Eliminar?'),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: colores.buttonCategoria,
              ),
              child: Icon(Icons.cancel, color: colores.buttonCategoria2),
              onPressed: () => Navigator.pop(context),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: Icon(Icons.check_circle),
              onPressed: () {
                // print(ideliminar);
                eliminarMascota(ideliminar);
                // uiProvider.selectedMenuOpt = 2;
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePages()));
              },
            ),
          ],
        );
      },
    );
  }
}
