import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_parcial_1/estilos/Colores.dart';
import 'package:provider/provider.dart';

import '../providers/ui_provider.dart';

class BarraInferion extends StatefulWidget {
  @override
  State<BarraInferion> createState() => _BarraInferionState();
}

class _BarraInferionState extends State<BarraInferion> {
    int _selectedIndex = 1;
    Colores _colores = Colores();

  List<Widget> tabItems = [
    Center(child: Text("0")),
    Center(child: Text("1")),
    Center(child: Text("2")),
    Center(child: Text("3")),
    Center(child: Text("4"))
  ];

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    return FlashyTabBar(
          animationCurve: Curves.linear,
          selectedIndex: _selectedIndex,
          showElevation: false, // use this to remove appBar's elevation
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
              if (_selectedIndex==0) {
                uiProvider.selectedMenuOpt=3;
              }
              if (_selectedIndex==1) {
                uiProvider.selectedMenuOpt=2;
              }
              if (_selectedIndex==2) {
                uiProvider.selectedMenuOpt=4;
              }
              if (_selectedIndex==3) {
                uiProvider.selectedMenuOpt=5;
              }
          }),
          items: [
            FlashyTabBarItem(
              icon: Icon(Icons.add_box_rounded, size: 22,color:_colores.quinary),
              title: Text('Adopciones',style: TextStyle(color: _colores.ternary)),
            ),
            FlashyTabBarItem(
              icon: Icon(Icons.home, size: 22,color:_colores.quinary),
              title: Text('Recientes',style: TextStyle(color: _colores.ternary)),
            ),
            FlashyTabBarItem(
              icon: Icon(Icons.currency_exchange, size: 22,color:_colores.quinary),
              title: Text('Donaciones',style: TextStyle(color: _colores.ternary)),
            ),
            FlashyTabBarItem(
              icon: Icon(Icons.pets_outlined, size: 22,color:_colores.quinary),
              title: Text('Veterinaria',style: TextStyle(color: _colores.ternary)),
            ),
          ],
        );
  }
}