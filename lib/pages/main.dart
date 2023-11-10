import 'package:flutter/material.dart';
import 'package:flutter_application_parcial_1/providers/ui_provider_mascota.dart';
import 'package:provider/provider.dart';
import '../providers/ui_provider.dart';
import '../widgets/widget_Iniciar.dart';
import 'homes_pages.dart';
import 'login.dart';

void main() { 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (context) => UiProvider()),
        ChangeNotifierProvider(create: (_) =>  UiProviderMascota()),

      ],
      child: MaterialApp(
        title: 'Flutter Demo', 
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: 'homes',
        routes: {
          // 'myHomes'  : (BuildContext context) => MyHomePage(),
          'homes'  : (BuildContext context) => HomePages(),
          'login'  : (BuildContext context) => LoginPage(),
          'widgetlogin'  : (BuildContext context) => WidgetIniciar(),
        },
        // home: MyHomePage(title: 'Login')
      ),
    );
  }
}