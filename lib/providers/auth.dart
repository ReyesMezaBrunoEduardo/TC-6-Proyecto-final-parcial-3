import 'package:flutter/material.dart';
class AuthProvider extends ChangeNotifier {
String? correoActual;
final Map<String, String> usuarios = {};
bool login(
String correo,
String password,
) {
if (
usuarios.containsKey(correo)
&&
usuarios[correo] == password
) {
correoActual = correo;
notifyListeners();
return true;
}
return false;
}
void register(
String correo,
String password,
) {
usuarios[correo] = password;
notifyListeners();
}
void logout() {
correoActual = null;
notifyListeners();
}
}