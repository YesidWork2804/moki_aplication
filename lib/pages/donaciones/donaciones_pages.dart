import 'package:flutter/material.dart';
import 'package:flutter_application_parcial_1/estilos/Colores.dart';
import 'package:flutter_application_parcial_1/widgets/partTopList.dart';

class DonacionesPage extends StatefulWidget {
  const DonacionesPage({Key? key}) : super(key: key);

  @override
  State<DonacionesPage> createState() => _DonacionesPageState();
}

Colores colores = Colores();

class _DonacionesPageState extends State<DonacionesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: pageAdopciones(), backgroundColor: Colors.white);
  }
}

Widget pageAdopciones() {
  return Column(
    children: [
      PartTopList(textBuscar: 'Buscar Donaciones',tipo:''),
      Expanded(
        child: (ListView(
          children: [
            cardMascota('Max', '1 Año', colores.getColor()[0]),
            cardMascota('Tommy', '3 meses', colores.getColor()[3]),
            cardMascota('Luna', '1 Año', colores.getColor()[2]),
            cardMascota('Toby', '3 meses', colores.getColor()[1]),
          ],
          padding: EdgeInsets.all(10),
        )),
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
            borderRadius: BorderRadius.circular(25),
            // color: Color.fromARGB(179, 209, 209, 209),
            border: Border.all(
                color: Color.fromARGB(179, 209, 209, 209), width: 2)
            ),
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
          ],
        )),
  ]);
}
