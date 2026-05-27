import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import 'package:aplicacionfinal/providers/vidas.dart';
import 'package:aplicacionfinal/providers/puntaje.dart';
import 'package:aplicacionfinal/providers/idioma.dart';

import '../utils/colores.dart';
import '../screens/menu.dart';
import '../screens/trivia.dart';

class DerrotaScreen extends StatelessWidget {
  final String motivo;

  const DerrotaScreen({
    super.key,
    required this.motivo,
  });

  @override
  Widget build(BuildContext context) {
    final vidasProvider = Provider.of<VidasProvider>(context);
    final esPorVidas = motivo == 'vidas';

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: Container(
          color: Colores.fondo,
          child: Column(
            children: [

              Container(
                width: double.infinity,
                height: 250,
                color: Colores.fondo,
                child: Center(
                  child: Image.asset(
                    'assets/S.png',
                    width: 220,
                    height: 220,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const MenuScreen(),
                    ),
                  );
                },

                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),

                  child: const Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,

                    children: [

                      Text(
                        'Página principal',

                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colores.azul,
                        ),
                      ),

                      Icon(
                        Icons.home,
                        color: Colores.azul,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 40),
              const Text(
                'Idiomas',

                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colores.azul,
                ),
              ),

              const SizedBox(height: 15),

              idiomaDrawer(
                context,
                imagen: 'assets/az.png',
                texto: 'Inglés',
                idioma: 'en',
              ),

              idiomaDrawer(
                context,
                imagen: 'assets/portaz.png',
                texto: 'Portugués',
                idioma: 'pt',
              ),

              idiomaDrawer(
                context,
                imagen: 'assets/itaz.png',
                texto: 'Italiano',
                idioma: 'it',
              ),

               GestureDetector(
                onTap: () async {

                  showDialog(
                    context: context,
                    barrierDismissible: false,

                    builder: (_) {
                      return AlertDialog(
                        shape:
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(
                                    20,
                                  ),
                            ),

                        content: Row(
                          children: const [

                            CircularProgressIndicator(),

                            SizedBox(width: 20),

                            Expanded(
                              child: Text(
                                'Saliendo de la aplicación...',

                                style: TextStyle(
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );

                  await Future.delayed(
                    const Duration(seconds: 2),
                  );

                  Navigator.pop(context);
                },

                child: Container(
                  margin:
                      const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),

                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,

                    children: const [

                      Text(
                        'Salir',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight:
                              FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Icon(
                        Icons.logout,
                        color: Color.fromARGB(255, 0, 0, 0),
                        size: 28,
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding:
                    const EdgeInsets.only(
                      bottom: 0,
                    ),
                child: Image.asset(
                  'assets/menu.png',
                  height: 180,
                ),
              ),
            ],
          ),
        ),
      ),

      appBar: AppBar(
        backgroundColor: Colores.amarillo,
        elevation: 0,

        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
              size: 32,
            ),

            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
            ),

            child: Row(
              children: [

                const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 30,
                ),

                const SizedBox(width: 5),

                Text(
                  '${vidasProvider.vidas}',

                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center,

            children: [

              Text(
                esPorVidas
                    ? '¡Se acabó el tiempo!'
                    : '¡Te quedaste sin vidas!',

                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),

                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 30),

              Container(
  height: 260,
  width: 260,

  child: Stack(
    children: [
      Lottie.asset(
        esPorVidas
            ? 'assets/anima/Sleeping.json'
            : 'assets/anima/broken heart.json',

        fit: BoxFit.contain,
      ),

      if (esPorVidas)
        Positioned(
          left: 5,
          top: 70,

          child: Image.asset(
            'assets/sueño.png',

            width: 180,
            height: 150,
            fit: BoxFit.contain,
          ),
        ),
    ],
  ),
),

              const SizedBox(height: 40),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colores.facil,

                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),

                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(40),
                  ),
                ),

                onPressed: () {

                  Provider.of<VidasProvider>(
                    context,
                    listen: false,
                  ).reiniciarVidas();

                  Provider.of<PuntajeProvider>(
                    context,
                    listen: false,
                  ).reiniciarPuntaje();

                  Navigator.pushReplacement(
                    context,

                    MaterialPageRoute(
                      builder: (_) =>
                          const TriviaScreen(),
                    ),
                  );
                },

                child: const Text(
                  'Reintentar',

                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              GestureDetector(
                onTap: () {

                  Provider.of<VidasProvider>(
                    context,
                    listen: false,
                  ).reiniciarVidas();

                  Provider.of<PuntajeProvider>(
                    context,
                    listen: false,
                  ).reiniciarPuntaje();

                  Navigator.pushAndRemoveUntil(
                    context,

                    MaterialPageRoute(
                      builder: (_) =>
                          const MenuScreen(),
                    ),

                    (route) => false,
                  );
                },

                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),

                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255,173,169,169,),

                    borderRadius:
                        BorderRadius.circular(40),
                  ),

                  child: const Text(
                    'Volver al menú',

                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget idiomaDrawer(
    BuildContext context, {
    required String imagen,
    required String texto,
    required String idioma,
  }) {
    return GestureDetector(
      onTap: () {

        Provider.of<IdiomaProvider>(
          context,
          listen: false,
        ).cambiarIdioma(idioma);

        Navigator.pop(context);
      },

      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 8,
        ),

        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 12,
        ),

        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,

          children: [

            Text(
              texto,

              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colores.azul,
                letterSpacing: 1,
              ),
            ),

            Image.asset(
              imagen,
              width: 45,
              height: 45,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}