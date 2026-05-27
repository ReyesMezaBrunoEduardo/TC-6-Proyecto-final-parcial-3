import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:aplicacionfinal/providers/dificultad.dart';
import 'package:aplicacionfinal/providers/idioma.dart';
import '../screens/menu.dart';
import '../screens/trivia.dart';
import '../utils/colores.dart';

class DificultadScreen extends StatelessWidget {
  const DificultadScreen({super.key});

  String t(
    String es,
    String en,
    String it,
    String pt,
    String idioma,
  ) {
    switch (idioma) {
      case 'en': return en;
      case 'it': return it;
      case 'pt': return pt;
      default: return es;
    }
  }

  @override
  Widget build(BuildContext context) {
    final idioma =
        context.watch<IdiomaProvider>().idiomaActual;

    final gameProvider =
        context.read<GameProvider>();

    return Scaffold(
      backgroundColor: Colores.raro,

      drawer: Drawer(
        child: Container(
          color: Colores.fondo,

          child: Column(
            children: [

              SizedBox(
                width: double.infinity,
                height: 220,

                child: Center(
                  child: Image.asset(
                    'assets/S.png',
                    width: 220,
                    height: 220,
                  ),
                ),
              ),

              GestureDetector(
                onTap:
                    () => Navigator.pushReplacement(
                      context,

                      MaterialPageRoute(
                        builder:
                            (_) =>
                                const MenuScreen(),
                      ),
                    ),

                child: Container(
                  margin:
                      const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),

                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,

                    children: [

                      Text(
                        t(
                          'Página principal',
                          'Home',
                          'Pagina principale',
                          'Página inicial',
                          idioma,
                        ),

                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight:
                              FontWeight.bold,
                          color: Colores.azul,
                        ),
                      ),

                      const Icon(
                        Icons.home,
                        color: Colores.azul,
                        size: 28,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 40),

              Text(
                t(
                  'Idiomas',
                  'Languages',
                  'Lingue',
                  'Idiomas',
                  idioma,
                ),

                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              idiomaDrawer(
                context,
                'assets/az.png',
                t(
                  'Inglés',
                  'English',
                  'Inglese',
                  'Inglês',
                  idioma,
                ),
                'en',
              ),

              idiomaDrawer(
                context,
                'assets/portaz.png',
                t(
                  'Portugués',
                  'Portuguese',
                  'Portoghese',
                  'Português',
                  idioma,
                ),
                'pt',
              ),

              idiomaDrawer(
                context,
                'assets/itaz.png',
                t(
                  'Italiano',
                  'Italian',
                  'Italiano',
                  'Italiano',
                  idioma,
                ),
                'it',
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
        centerTitle: true,
        automaticallyImplyLeading: false,

        leading: Builder(
          builder:
              (context) => IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black,
                  size: 32,
                ),

                onPressed:
                    () =>
                        Scaffold.of(
                          context,
                        ).openDrawer(),
              ),
        ),

        title: Text(
          t(
            'Dificultad',
            'Difficulty',
            'Difficoltà',
            'Dificuldade',
            idioma,
          ),

          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: const [

          Padding(
            padding: EdgeInsets.only(right: 20),

            child: Row(
              children: [

                Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 28,
                ),

                SizedBox(width: 5),

                Text(
                  '5',

                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [

            const SizedBox(height: 40),

            Text(
              t(
                '¡Elige tu dificultad!',
                'Choose your difficulty!',
                'Scegli la difficoltà!',
                'Escolha sua dificuldade!',
                idioma,
              ),

              textAlign: TextAlign.center,

              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A1358),
              ),
            ),

            const SizedBox(height: 25),

            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),

                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,

                  children: [

                    dificultadBoton(
                      t(
                        'Fácil',
                        'Easy',
                        'Facile',
                        'Fácil',
                        idioma,
                      ),

                      Colores.facil,

                      () {
                        gameProvider
                            .cambiarDificultad(
                              'facil',
                            );

                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder:
                                (_) =>
                                    const TriviaScreen(),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 20),

                    dificultadBoton(
                      t(
                        'Medio',
                        'Medium',
                        'Medio',
                        'Médio',
                        idioma,
                      ),

                      Colores.medio,

                      () {
                        gameProvider
                            .cambiarDificultad(
                              'medio',
                            );

                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder:
                                (_) =>
                                    const TriviaScreen(),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 25),

                    dificultadBoton(
                      t(
                        'Difícil',
                        'Hard',
                        'Difficile',
                        'Difícil',
                        idioma,
                      ),

                      Colores.dificl,

                      () {
                        gameProvider
                            .cambiarDificultad(
                              'dificil',
                            );

                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder:
                                (_) =>
                                    const TriviaScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              width: 180,
              height: 180,

              child: Lottie.asset(
                'assets/anima/Monster 3.json',
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget idiomaDrawer(
    BuildContext context,
    String imagen,
    String texto,
    String idioma,
  ) {
    return GestureDetector(
      onTap: () {

        context.read<IdiomaProvider>()
            .cambiarIdioma(idioma);

        Navigator.pop(context);
      },

      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),

        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),

        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,

          children: [

            Text(
              texto,

              style: const TextStyle(
                fontSize: 18,
                fontWeight:
                    FontWeight.bold,
                color: Colores.azul,
              ),
            ),

            Image.asset(
              imagen,
              width: 40,
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  Widget dificultadBoton(
    String titulo,
    Color color,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        width: double.infinity,

        padding: const EdgeInsets.symmetric(
          vertical: 18,
        ),

        decoration: BoxDecoration(
          color: color,
          borderRadius:
              BorderRadius.circular(35),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),

        child: Center(
          child: Text(
            titulo,

            style: const TextStyle(
              fontSize: 24,
              color: Colores.azul,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}