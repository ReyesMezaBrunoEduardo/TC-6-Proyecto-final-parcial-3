import 'package:flutter/material.dart';

class IdiomaProvider extends ChangeNotifier {
  String idiomaActual = 'es';

  void cambiarIdioma(String idioma) {
    idiomaActual = idioma;
    notifyListeners();

  }

}