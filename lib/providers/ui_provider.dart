
import 'package:flutter/foundation.dart';

class UiProvider extends ChangeNotifier {
  int _selectedMenuOpt = 1;
  String buttonProvider = 'Registrate';

  String get selectedTaskProvider {
    return this.buttonProvider;
  }

  set selectedTaskProvider( String taskProvider ){
    this.buttonProvider = taskProvider;
    notifyListeners();
  }


  int get selectedMenuOpt {
    return this._selectedMenuOpt;
  }

  set selectedMenuOpt( int i ){
    this._selectedMenuOpt = i;
    notifyListeners();
  }
}