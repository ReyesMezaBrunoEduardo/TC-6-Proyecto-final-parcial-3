import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/colores.dart';
import 'package:aplicacionfinal/providers/idioma.dart';
import 'package:aplicacionfinal/screens/menu.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final idiomaProvider = Provider.of<IdiomaProvider>(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fondo.png'),
            fit: BoxFit.cover,
          ),
        ),

        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '¿Qué idioma\nprefieres?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1358),
                  ),
                ),

                const SizedBox(height: 60),

                idiomaBoton(
                  texto: 'Portugués',
                  imagen: 'assets/por.png',
                  color: const Color.fromARGB(226, 255, 253, 122),
                  onTap: () {
                    idiomaProvider.cambiarIdioma('pt');
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const MenuScreen(),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 20),

                idiomaBoton(
                  texto: 'Italiano',
                  imagen: 'assets/it.png',
                  color: const Color(0xFFaee8ff),
                  onTap: () {
                    idiomaProvider.cambiarIdioma('it');
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const MenuScreen(),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 20),

                idiomaBoton(
                  texto: 'Inglés',
                  imagen: 'assets/eu.png',
                  color:  Colores.numeros,
                  onTap: () {
                    idiomaProvider.cambiarIdioma('en');
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const MenuScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget idiomaBoton({
    required String texto,
    required String imagen,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          width: 280, 
          height: 117,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(35),
          ),
          child: Column(
            children: [
              Text(
                texto,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              Image.asset(
                imagen,
                width: 80,
                height: 70,
              ),
            ],
          ),
        ),
      ),
    );
  }
}