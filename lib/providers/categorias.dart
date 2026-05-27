import 'package:flutter/material.dart';

class CategoriaProvider extends ChangeNotifier {

  String categoriaActual = '';

  String dificultadActual = '';

  void cambiarCategoria(
    String categoria,
  ) {
    categoriaActual = categoria;
    notifyListeners();
  }
  void cambiarDificultad(
    String dificultad,
  ) {
    dificultadActual = dificultad;
    notifyListeners();
  }
}