import 'package:flutter/material.dart';
import 'package:aplicacionfinal/screens/login.dart';
import '../utils/colores.dart';

class LoginScreenn extends StatefulWidget {
  const LoginScreenn({super.key});

  @override
  State<LoginScreenn> createState() =>
      _LoginScreenState();
}

class _LoginScreenState
    extends State<LoginScreenn> {

  final usuarioController =
      TextEditingController();

  final passwordController =
      TextEditingController();

  String error = '';

  void iniciarSesion() {
    if (usuarioController.text == 'hola' &&
        passwordController.text == '1234') {

      Navigator.pushReplacement(
        context,

        MaterialPageRoute(
          builder:
              (_) => const LoginScreen(),
        ),
      );

    } else {
      setState(
        () => error =
            'Usuario o contraseña incorrectos',
      );
    }
  }

  InputDecoration input(
    String texto,
    IconData icono,
  ) {
    return InputDecoration(
      hintText: texto,
      filled: true,
      fillColor: Colors.grey.shade200,

      border: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),

      prefixIcon: Icon(icono),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colores.amarillo,
        elevation: 0,
        centerTitle: true,

        title: const Text(
          'Iniciar Sesión',

          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Center(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(
                horizontal: 30,
              ),

          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center,

            children: [

              Image.asset(
                'assets/SB.png',
                height: 250,
              ),

              TextField(
                controller: usuarioController,
                decoration: input(
                  'Usuario',
                  Icons.person,
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: passwordController,
                obscureText: true,

                decoration: input(
                  'Contraseña',
                  Icons.lock,
                ),
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                height: 60,

                child: ElevatedButton(
                  onPressed: iniciarSesion,

                  style:
                      ElevatedButton.styleFrom(
                        backgroundColor:
                            Colores.amarillo,

                        shape:
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(
                                    20,
                                  ),
                            ),
                      ),

                  child: const Text(
                    'Entrar',

                    style: TextStyle(
                      fontSize: 22,
                      fontWeight:
                          FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Text(
                error,

                style: const TextStyle(
                  color: Colors.red,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}