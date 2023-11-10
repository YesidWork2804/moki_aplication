class Categoria {
  var nombre;
  bool estado;

  Categoria({this.nombre, required this.estado});

  List<Categoria> categorias = [
  Categoria(nombre: 'Todos',estado: true),
  Categoria(nombre: 'Perros',estado: false),
  Categoria(nombre: 'Gatos',estado: false),
  Categoria(nombre: 'Otros',estado: false),
];

}
