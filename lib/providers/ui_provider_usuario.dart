
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../models/models.dart';

class UsuarioProvider extends ChangeNotifier {
  Usuario _usuario = Usuario();

  Usuario get selectedTask {
    return _usuario;
  }


  set selectedTask( Usuario taskModelGet ){

    _usuario = taskModelGet;

    notifyListeners();
  }

}