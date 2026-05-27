import 'package:flutter/material.dart';

class VidasProvider extends ChangeNotifier {

  int _vidas = 5;

  int get vidas => _vidas;

  void perderVida() {

    if (_vidas > 0) {
      _vidas--;
      notifyListeners();
    }
  }
  void reiniciarVidas() {
    _vidas = 5;
    notifyListeners();

  }

}