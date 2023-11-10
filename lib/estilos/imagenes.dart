getImagenes() {

    //retornar lista de imagenes
    List<String> list = [
      'imgVeterinaria1.png',
      'imgVeterinaria6.png',
      'imgVeterinaria3.png',
      'imgVeterinaria4.png',
      'imgVeterinaria5.png',
      'imgVeterinaria6.png',
    ];
    //retronar una lista de colores  que cuando llegue al final del listado regrese al principio
    // print(TaskProvider().listTasks.length);
    print(list.length);
    return list;
  }

getNombresVeterinaria(){
      List<String> list = [
      'Santo tomás',
      'San martín',
      'El nepal',
      'La gloria',
      'El bolivar',
      'Las aguas',
    ];
    return list;
}

getDireccionVeterinaria(){
      List<String> list = [
      'Carrera 17 #25-34',
      'Carrera 23 #25-24',
      'Carrera 30 #15-34',
      'Carrera 27 #25-14',
      'Carrera 47 #25-24',
      'Carrera 5 #23-34',
    ];
    return list;
}