import 'package:flutter/material.dart';
import 'package:flutter_application_parcial_1/estilos/Colores.dart';
import 'package:flutter_application_parcial_1/estilos/imagenes.dart';
import 'package:flutter_application_parcial_1/widgets/partTopList.dart';

class VeterinariaPage extends StatefulWidget {
  const VeterinariaPage({Key? key}) : super(key: key);

  @override
  State<VeterinariaPage> createState() => _VeterinariaPageState();
}

Colores colores = Colores();

class _VeterinariaPageState extends State<VeterinariaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageAdopciones(), backgroundColor: Colors.white
    );
  }
}

Widget pageAdopciones() {
  return Column(
    children: [
      PartTopList(textBuscar: 'Buscar Veterinaria', tipo: 'veterinaria'),
      Expanded(
        child: (GridView.builder(
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                            color: Color.fromARGB(179, 209, 209, 209),
                            width: 2)),
                    // padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    child: Stack(
                      children: [
                        Image(
                            image:
                                AssetImage('assets/' + getImagenes()[index])),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: colores.white,
                            ),
                            child: Container(
                              padding: EdgeInsets.only(left: 10,top: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(getNombresVeterinaria()[index],style: TextStyle(fontWeight: FontWeight.bold)),
                                  Text(getDireccionVeterinaria()[index]),
                                ],
                              ),
                            ),
                            width: 169,
                            height: 50,
                          ),
                        ),
                      ],
                    ),
                  );
                })
            //   ListView(
            //   children: [
            //     cardMascota('Max', '1 Año', colores.getColor()[0]),
            //     cardMascota('Tommy', '3 meses', colores.getColor()[3]),
            //     cardMascota('Luna', '1 Año', colores.getColor()[2]),
            //     cardMascota('Toby', '3 meses', colores.getColor()[1]),
            //   ],
            //   padding: EdgeInsets.all(10),
            // )
            ),
      ),
    ],
  );
}

Widget cardMascota(String nombre, String edad, Color colorTarjeta) {
  return Stack(children: [
    Positioned(
      right: 100,
      top: 27,
      child: Image(image: AssetImage('assets/icondonar.png'), width: 50),
    ),
    Positioned(
      right: 20,
      top: 35,
      child: Image(image: AssetImage('assets/iconprecio.png'), width: 77),
    ),
    Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            // color: Color.fromARGB(98, 247, 247, 247),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
                color: Color.fromARGB(179, 209, 209, 209), width: 2)),
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundColor: colorTarjeta,
              backgroundImage: AssetImage('assets/dog2.png'),
            ),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(nombre,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                SizedBox(height: 10),
                Text(edad,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: colores.edadMascota)),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     Image(
            //         image: AssetImage('assets/iconBienDonaciones.png'),
            //         width: 40),
            //     SizedBox(width: 10),
            //     Image(
            //         image: AssetImage('assets/iconXDonaciones.png'), width: 42),
            //   ],
            // ),
          ],
        )),
  ]);
}
