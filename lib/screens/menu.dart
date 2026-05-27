import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aplicacionfinal/providers/categorias.dart';
import 'package:aplicacionfinal/providers/idioma.dart';
import 'package:aplicacionfinal/screens/seleccionadif.dart';
import '../utils/colores.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  String t(String es, String en, String it, String pt, String idioma) {
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
    final idioma = Provider.of<IdiomaProvider>(context).idiomaActual;

    return Scaffold(
      backgroundColor: Colores.raro,

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
                onTap: () => Navigator.pop(context),

                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),

                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,

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
                          fontWeight: FontWeight.bold,
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

              const SizedBox(height: 10),

              idiomaDrawer(
                context,
                'assets/az.png',
                t('Inglés', 'English', 'Inglese', 'Inglês', idioma),
                'en',
              ),

              idiomaDrawer(
                context,
                'assets/portaz.png',
                t('Portugués', 'Portuguese', 'Portoghese', 'Português', idioma),
                'pt',
              ),

              idiomaDrawer(
                context,
                'assets/itaz.png',
                t('Italiano', 'Italian', 'Italiano', 'Italiano', idioma),
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

        actions: const [

          Padding(
            padding: EdgeInsets.only(right: 20),

            child: Row(
              children: [

                Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 30,
                ),

                SizedBox(width: 5),

                Text(
                  '5',

                  style: TextStyle(
                    fontSize: 24,
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
          children: [

            const SizedBox(height: 40),

            Text(
              t(
                'Selecciona una categoría',
                'Select a category',
                'Seleziona una categoria',
                'Selecione uma categoria',
                idioma,
              ),

              textAlign: TextAlign.center,

              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colores.azul,
              ),
            ),

            const SizedBox(height: 40),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.symmetric(horizontal: 25),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,

                children: [

                  categoriaBoton(
                    context,
                    t('Números', 'Numbers', 'Numeri', 'Números', idioma),
                    'assets/signos.png',
                    Colores.numeros,
                    'numeros',
                  ),

                  categoriaBoton(
                    context,
                    t('Frutas', 'Fruits', 'Frutta', 'Frutas', idioma),
                    'assets/frutas.png',
                    Colores.frutas,
                    'frutas',
                  ),

                  categoriaBoton(
                    context,
                    t('Animales', 'Animals', 'Animali', 'Animais', idioma),
                    'assets/perrito.png',
                    Colores.letras,
                    'animales',
                  ),

                  categoriaBoton(
                    context,
                    t('Colores', 'Colors', 'Colori', 'Cores', idioma),
                    'assets/color.png',
                    Colores.colores,
                    'colores',
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 10),

              child: Image.asset(
                'assets/op.png',
                height: 220,
                fit: BoxFit.contain,
              ),
            ),
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
            ),
          ],
        ),
      ),
    );
  }

  Widget categoriaBoton(
    BuildContext context,
    String titulo,
    String imagen,
    Color color,
    String categoria,
  ) {
    return GestureDetector(
      onTap: () {

        Provider.of<CategoriaProvider>(
          context,
          listen: false,
        ).cambiarCategoria(categoria);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const DificultadScreen(),
          ),
        );
      },

      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(35),

          boxShadow: const [

            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),

        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [

            Image.asset(
              imagen,
              height: 70,
            ),

            const SizedBox(height: 10),

            Text(
              titulo,

              style: const TextStyle(
                fontSize: 24,
                color: Colores.azul,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}