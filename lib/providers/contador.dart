import 'dart:async';
import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier {
  int tiempoRestante = 0;
  Timer? _timer;
  void iniciarTimer(String dificultad) {
    _timer?.cancel();
    switch (dificultad) {

      case 'facil':
        tiempoRestante = 90;
        break;

      case 'medio':
        tiempoRestante = 120;
        break;

      case 'dificil':
        tiempoRestante = 150;
        break;
    }
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (tiempoRestante > 0) {
          tiempoRestante--;
          notifyListeners();
        }
        else { 
          timer.cancel();
        }
      },
    );
    notifyListeners();
  }
  void detenerTimer() {
    _timer?.cancel();
  }
}