import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_parcial_1/estilos/Colores.dart';
import 'package:flutter_application_parcial_1/peticiones/peticiones_mascota.dart';
import 'package:flutter_application_parcial_1/providers/ui_provider_mascota.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../widgets/showAlertDialog.dart';

class AgregarMascota extends StatefulWidget {
  @override
  _AgregarMascotaState createState() => _AgregarMascotaState();
}

class _AgregarMascotaState extends State<AgregarMascota> {
  TextEditingController controlNombre = TextEditingController();
  TextEditingController controledad = TextEditingController();
  TextEditingController controlsexo = TextEditingController();
  TextEditingController controlcolor = TextEditingController();
  TextEditingController controlfoto = TextEditingController();
  TextEditingController controldescripcion = TextEditingController();
  PickedFile? _imageFile;
  final ImagePicker _picker = ImagePicker();
  String imagen = '';

  @override
  Widget build(BuildContext context) {
    Colores _colores = new Colores();
    final uiProviderMascota = Provider.of<UiProviderMascota>(context);

    var select = uiProviderMascota.selectedEdadFecha;


    return Scaffold(
      appBar: AppBar(
        backgroundColor: _colores.ternary,
        title: Text("Adicionar Mascota"),
      ),
      body: Container(
        margin: EdgeInsets.all(5.0),
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: ListView(
            children: <Widget>[
              Center(
                child:
              imageProfile(context),
              ),

              SizedBox(
                height: 10.0,
              ),

              TextFormField(
                controller: controlNombre,
                decoration: InputDecoration(
                  labelText: "Nombre",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),

              TextButton(
                  onPressed: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        // minTime: DateTime(2018, 3, 5),
                        maxTime: DateTime.now(), onChanged: (date) {
                      // print('change $date');
                    }, onConfirm: (date) {
                      var year = date.year;
                      var month = date.month;
                      var day = date.day;
                      uiProviderMascota.selectedEdadFecha =
                          '$year/' + '$month/' + '$day';
                      // print('confirm $date');
                    }, currentTime: DateTime.now(), locale: LocaleType.es);
                  },
                  child: Row(
                    children: [
                      Text('Fecha de Nacimiento: ',
                          style: TextStyle(color: Colors.black)),
                      Text(
                        '$select',
                        style: TextStyle(color: _colores.ternary),
                      ),
                    ],
                  )),
              SizedBox(
                height: 10.0,
              ),
              DropdownButton<String>(
                value: uiProviderMascota.genero,
                elevation: 16,
                style: TextStyle(color: _colores.ternary),
                underline: Container(
                  height: 2,
                  color: _colores.ternary,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    if (newValue == 'Masculino') {
                      uiProviderMascota.genero = 'Masculino';
                    }
                    if (newValue == 'Femenino') {
                      uiProviderMascota.genero = 'Femenino';
                    }
                    if (newValue == 'Otros') {
                      uiProviderMascota.genero = 'Otros';
                    }
                  });
                },
                items: <String>['Masculino', 'Femenino', 'Otros']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: controlcolor,
                decoration: InputDecoration(
                  labelText: "Color",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: controldescripcion,
                decoration: InputDecoration(
                  labelText: "Descripcion",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: _colores.ternary,
                ),
                //color de fondo
                child: Text("Adicionar Mascota"),
                onPressed: () {
                  if (select == 'Seleccionar edad de la Mascota') {
                    showAlertDialog(context);
                  } else {
                    adicionarMascota(
                        controlNombre.text,
                        select,
                        // controledad.text,
                        controlsexo.text,
                        controlcolor.text,
                        imagen,
                        // controlfoto.text,
                        controldescripcion.text);
                    uiProviderMascota.selectedEdadFecha = 'Seleccionar edad de la Mascota';
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget bottomSheet(context){
      Colores _colores = new Colores();

    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20
      ),
      child: Column(children: [
        Text(
          "Elija la foto de la Mascota",
          style: TextStyle(
            fontSize: 20.0
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: _colores.white
              ),
              icon: Icon(Icons.camera,color: _colores.black2),
              onPressed: (){
                takePhoto(ImageSource.camera);
              },
              label: Text("Camara", style: TextStyle(color: _colores.black2)),
            ),
            SizedBox(width: 10),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: _colores.white
              ),
              icon: Icon(Icons.image, color: _colores.black2),
              onPressed: (){
                takePhoto(ImageSource.gallery);
              },
              label: Text("Galeria", style: TextStyle(color: _colores.black2)),
            ),
          ],
        )
      ]),
    );
  }

  Widget imageProfile( BuildContext context) {
      Colores _colores = new Colores();

    return Stack(
      children: <Widget> [

          _imageFile == null ?
        CircleAvatar(
          radius: 80.0,
          backgroundColor: Colors.white,
          backgroundImage:
            AssetImage("assets/imageIniciarSesion.png")
        ) : 
        CircleAvatar(
          radius: 80.0,
          backgroundColor: Colors.white,
          backgroundImage:
            FileImage(File(_imageFile!.path))
            // FileImage(File(_imageFile!.path)) 
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: InkWell(
              onTap: (() {
              showModalBottomSheet(context: context, builder: ((builder) => bottomSheet(context)));
            }),
            child: Icon(
              Icons.camera_alt,
              color: _colores.ternary,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
    void takePhoto(ImageSource source) async {
    // final String pathRuta = ( getTemporayDirectory()).pat;

      final pickedFile = await _picker.getImage(
        source: source,
      );

      setState((){
        _imageFile = pickedFile;
        imagen = _imageFile?.path as String;
        // print('PPPP');
        // print(imagen);
      });
    }

}