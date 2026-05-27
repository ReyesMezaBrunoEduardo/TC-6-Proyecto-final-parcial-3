import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import '../utils/colores.dart';
import 'package:aplicacionfinal/providers/idioma.dart';
import 'package:aplicacionfinal/providers/vidas.dart';
import 'package:aplicacionfinal/providers/puntaje.dart';
import 'package:aplicacionfinal/screens/menu.dart';

class VictoriaScreen extends StatelessWidget {
  const VictoriaScreen({super.key});

  String t(
    String es, String en, String it, String pt, String idioma,
  ) {
    switch (idioma) {
      case 'en':
        return en;
      case 'it':
        return it;
      case 'pt':
        return pt;
      default:
        return es;
    }
  }

  @override
  Widget build(BuildContext context) {
    final idioma =
        context.watch<IdiomaProvider>().idiomaActual;
    final puntaje =
        context.watch<PuntajeProvider>();
    final vidas =
        context.watch<VidasProvider>();

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
                fontSize: 20,
                fontWeight:
                    FontWeight.bold,
                color: Colores.azul,
              ),
            ),

            const Icon(
              Icons.home,
              color: Colores.azul,
              size: 30,
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
          color: Colores.azul,
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
            '${vidas.vidas}',

            style: const TextStyle(
              fontSize: 24,
              fontWeight:
                  FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  ],
),

body: Stack(
children: [

Positioned.fill(
  child: IgnorePointer(
    child: Lottie.asset(
      'assets/anima/gana.json',
      fit: BoxFit.cover,
      repeat: true,
    ),
  ),
),

Center(
  child: Column(
    mainAxisAlignment:
        MainAxisAlignment.center,

    children: [

      Text(
        t(
          '¡Felicidades!',
          'Congratulations!',
          'Congratulazioni!',
          'Parabéns!',
          idioma,
        ),

        style: const TextStyle(
          fontSize: 35,
          fontWeight:
              FontWeight.bold,
        ),
      ),

      const SizedBox(height: 50),

      Image.asset(
        'assets/ganar.png',
        width: 300,
        height: 300,
      ),

      const SizedBox(height: 45),

      Text(
        '${t('Puntos', 'Points', 'Punti', 'Pontos', idioma)}: ${puntaje.resultado}',

        style: const TextStyle(
          fontSize: 25,
          fontWeight:
              FontWeight.bold,
        ),
      ),

      const SizedBox(height: 40),

      ElevatedButton(
        style:
            ElevatedButton.styleFrom(
              backgroundColor:
                  const Color.fromARGB(
                    255,
                    173,
                    169,
                    169,
                  ),

padding:
    const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 15,
    ),

shape:
    RoundedRectangleBorder(
      borderRadius:
          BorderRadius.circular(
            20,
          ),
    ),
),

    onPressed: () {
      context
          .read<VidasProvider>()
          .reiniciarVidas();
      context
          .read<PuntajeProvider>()
          .reiniciarPuntaje();

      Navigator.pushAndRemoveUntil(
        context,

        MaterialPageRoute(
          builder:
              (_) =>
                  const MenuScreen(),
        ),

                      (route) => false,
                    );
                  },
                  child: Text(
                    t(
                      'Volver al menú',
                      'Back to menu',
                      'Torna al menu',
                      'Voltar ao menu',
                      idioma,
                    ),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
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
                fontWeight:
                    FontWeight.bold,
                color: Colores.azul,
                letterSpacing: 1,
              ),
            ),

            Image.asset(
              imagen,
              width: 45,
              height: 45,
            ),
          ],
        ),
      ),
    );
  }
}