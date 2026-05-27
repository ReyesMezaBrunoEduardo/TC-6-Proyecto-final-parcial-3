import 'package:flutter/material.dart';

class PuntajeProvider extends ChangeNotifier {

  int _correctas = 0;
  int _total = 0;

  int get correctas => _correctas;
  int get total => _total;

  void responderCorrecto() {
    _correctas++;
    _total++;
    notifyListeners();
  }

  void responderIncorrecto() {
    _total++;
    notifyListeners();
  }

  String get resultado => '$_correctas/$_total';

  void reiniciarPuntaje() {
    _correctas = 0;
    _total = 0;
    notifyListeners();
  }
}