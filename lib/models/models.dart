// To parse this JSON data, do
//
//     final mascota = mascotaFromJson(jsonString);

import 'dart:convert';

Mascota mascotaFromJson(String str) => Mascota.fromJson(json.decode(str));

String mascotaToJson(Mascota data) => json.encode(data.toJson());

class Mascota {
    Mascota({
        required this.nombre,
        required this.edad,
        required this.sexo,
        required this.color,
        required this.foto,
        required this.descripcion,
        required this.id,
    });

    String nombre;
    String edad;
    String sexo;
    String color;
    String foto;
    String descripcion;
    String id;

    factory Mascota.fromJson(Map<String, dynamic> json) => Mascota(
        nombre: json["nombre"] as String,
        edad: json["edad"]as String,
        sexo: json["sexo"]as String,
        color: json["color"]as String,
        foto: json["foto"]as String,
        descripcion: json["descripcion"]as String,
        id: json["id"] as String,
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "edad": edad,
        "sexo": sexo,
        "color": color,
        "foto": foto,
        "descripcion": descripcion,
        "id": id,
    };
}


class Usuario {
  var nombre;
  var clave;

  Usuario({this.nombre = 'yesid', this.clave ='123'});
}
