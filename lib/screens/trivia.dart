import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:aplicacionfinal/providers/idioma.dart';
import 'package:aplicacionfinal/providers/puntaje.dart';
import 'package:aplicacionfinal/providers/categorias.dart';
import 'package:aplicacionfinal/providers/vidas.dart';
import 'package:aplicacionfinal/providers/dificultad.dart';

import '../utils/colores.dart';
import '../data/letras.dart';
import '../data/frutas.dart';
import '../data/colores.dart';
import '../data/numeros.dart';

import 'resultado.dart';
import 'perder.dart';
import 'menu.dart';

class TriviaScreen extends StatefulWidget {
  const TriviaScreen({super.key});

  @override
  State<TriviaScreen> createState() =>
      _TriviaScreenState();
}

class _TriviaScreenState
    extends State<TriviaScreen> {
  int indicePregunta = 0;
  int tiempoRestante = 0;

  late Timer timer;

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
  void initState() {
    super.initState();

    Future.microtask(() {
      final dificultad =
          Provider.of<GameProvider>(
            context,
            listen: false,
          ).dificultadActual;

      tiempoRestante =
          dificultad == 'facil'
              ? 90
              : dificultad == 'medio'
              ? 120
              : 150;

      timer = Timer.periodic(
        const Duration(seconds: 1),
        (t) {
          if (tiempoRestante > 0) {
            setState(() {
              tiempoRestante--;
            });
          } else {
            t.cancel();

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder:
                    (_) => const DerrotaScreen(
                      motivo: 'vidas',
                    ),
              ),
            );
          }
        },
      );
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categoria =
        context
            .watch<CategoriaProvider>().categoriaActual;

    final dificultad =
        context.watch<GameProvider>() .dificultadActual;
    final vidasProvider =context.watch<VidasProvider>();
    final puntajeProvider = context.watch<PuntajeProvider>();
    final idioma =context.watch<IdiomaProvider>().idiomaActual;

    final preguntas = {
      'numeros_facil': preguntasNumerosFacil,
      'numeros_medio':preguntasNumerosMedio,
      'numeros_dificil':preguntasNumerosDificil,

      'animales_facil':preguntasAnimalesFacil,
      'animales_medio':preguntasAnimalesMedio,
      'animales_dificil':preguntasAnimalesDificil,

      'colores_facil':preguntasColoresFacil,
      'colores_medio':preguntasColoresMedio,
      'colores_dificil':preguntasColoresDificil,

      'frutas_facil':preguntasFrutasFacil,
      'frutas_medio':preguntasFrutasMedio,
      'frutas_dificil':preguntasFrutasDificil,
    }['${categoria}_$dificultad']!;

    final pregunta =  preguntas[indicePregunta];

    return Scaffold(
      backgroundColor: Colors.white,

      drawer: Drawer(
        child: Container(
          color: Colores.fondo,

          child: Column(
            children: [

              SizedBox(
                width: double.infinity,
                height: 250,

                child: Center(
                  child: Image.asset(
                    'assets/S.png',
                    width: 250,
                    height: 250,
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
                  fontSize: 20,
                  fontWeight:
                      FontWeight.bold,
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

              const SizedBox(height: 25),

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
        backgroundColor: Colores.app,
        leading: Builder(
          builder:
              (context) => IconButton(
                icon: const Icon(Icons.menu),

                onPressed:
                    () =>
                        Scaffold.of(
                          context,
                        ).openDrawer(),
              ),
        ),

        actions: [
          Padding(
            padding:
                const EdgeInsets.only(
                  right: 15,
                ),

            child: Row(
              children: [
                const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                const SizedBox(width: 5),
                Text(
                  '${vidasProvider.vidas}',

                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [

            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),

                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius:
                      BorderRadius.circular(
                        15,
                      ),
                ),

                child: Text(
                  '$tiempoRestante s',style: const TextStyle(
                    fontWeight:
                        FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            Text(
              pregunta['pregunta'][idioma],

              textAlign: TextAlign.center,

              style: const TextStyle(
                fontSize: 25,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

const SizedBox(height: 30),

...pregunta['opciones'][idioma]
    .map<Widget>((opcion) {

      return Padding(
        padding:
            const EdgeInsets.only(
              bottom: 10,
            ),

        child: SizedBox(
          width: double.infinity,
          height: 60,

          child: ElevatedButton(
            style:
                ElevatedButton.styleFrom(
                  backgroundColor:
                      Colores.app,
                ),

            onPressed: () {

              final correcta =
                  opcion ==
                  pregunta['respuesta'][idioma];

              if (correcta) { puntajeProvider .responderCorrecto();
              } else { puntajeProvider .responderIncorrecto();
                vidasProvider .perderVida();
              }

              if (vidasProvider
                      .vidas ==
                  0) {

                Navigator.pushReplacement(
                  context,

                  MaterialPageRoute(
                    builder:
                        (_) =>
                            const DerrotaScreen(
                              motivo:
                                  'tiempo',
                            ),
                  ),
                );

                return;
              }

              if (indicePregunta ==
                  preguntas.length - 1) {

                Navigator.pushReplacement(
                  context,

                  MaterialPageRoute(
                    builder:
                        (_) =>
                            const VictoriaScreen(),
                  ),
                );

              } else {

                setState(() {
                  indicePregunta++;
                });
              }
            },

            child: Text(
              opcion,

              style:
                  const TextStyle(
                    fontSize: 18,
                    fontWeight:
                        FontWeight.bold,
                    color:
                        Colors.white,
                  ),
            ),
          ),
        ),
      );
    })
    .toList(),
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

        context
            .read<IdiomaProvider>()
            .cambiarIdioma(idioma);

        Navigator.pop(context);
      },

      child: Container(
        margin:
            const EdgeInsets.symmetric(
              horizontal: 15, vertical: 5,
            ),

        padding:
            const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 8,
            ),

        child: Row(
          mainAxisAlignment:
              MainAxisAlignment
                  .spaceBetween,

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
              width: 35,
              height: 35,
            ),
          ],
        ),
      ),
    );
  }
}