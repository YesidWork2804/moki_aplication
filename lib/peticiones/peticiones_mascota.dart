import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_application_parcial_1/models/models.dart';
import 'package:http/http.dart' as http;

Future<List<Mascota>> listarPost(http.Client client) async {
  final response =
     await client.get(Uri.parse('https://untrue-insanity.000webhostapp.com/API/listar.php'));
    return pasaraListas(response.body);
}

// Una función que convierte el body de la respuesta en un List<Photo>
List<Mascota> pasaraListas(String responseBody) {

  final pasar = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return pasar.map<Mascota>((json) => Mascota.fromJson(json)).toList();
}

void adicionarMascota(
    String nombre,
    String edad,
    String sexo,
    String color,
    String foto,
    String descripcion,
  ) async {
    try{
    // Dio dio = Dio();
      var  url = Uri.parse(
          "https://untrue-insanity.000webhostapp.com/API/adicionarMascota.php");

      await http.post(url, body: {
        'nombre': nombre,
        'edad': edad,
        'sexo': sexo,
        'color': color,
        'foto': foto,
        'descripcion': descripcion,
      });
    }
    catch(e){
      print(e);
    }

}
void editarMascota(
    int id,
    String nombre,
    String edad,
    String sexo,
    String color,
    String foto,
    String descripcion,
    ) async {
  String url = (
      "https://untrue-insanity.000webhostapp.com/API/EditarMascota.php");

  Dio dio = Dio();
  // dio.get(url);
  dio.get(
      url,
      queryParameters: {
        'id': id,
        'nombre': nombre,
        'edad': edad,
        'sexo': sexo,
        'color': color,
        'foto': foto,
        'descripcion': descripcion,
      });
}

  void eliminarMascota( int  id) async {
    Dio dio = Dio();

    String url = (
      "https://untrue-insanity.000webhostapp.com/API/EliminarMascota.php");
      await dio.get(url, queryParameters: {
        'id': id,
      });
  }
