import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {

  String categoriaActual = '';

  String dificultadActual = 'facil';

  void cambiarCategoria(
    String nuevaCategoria,
  ) {

    categoriaActual = nuevaCategoria;

    notifyListeners();

  }

  void cambiarDificultad(
    String nuevaDificultad,
  ) {

    dificultadActual = nuevaDificultad;

    notifyListeners();

  }

}