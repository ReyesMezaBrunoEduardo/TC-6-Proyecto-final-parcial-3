import '../screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/categorias.dart';
import '../providers/vidas.dart';
import '../providers/puntaje.dart';
import '../providers/dificultad.dart';
import '../providers/idioma.dart';
import '../providers/auth.dart';

void main() {

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(

      providers: [

        ChangeNotifierProvider(

          create: (_) => CategoriaProvider(),

        ),

        ChangeNotifierProvider(

          create: (_) => VidasProvider(),

        ),

        ChangeNotifierProvider(

          create: (_) => PuntajeProvider(),

        ),

        ChangeNotifierProvider(

          create: (_) => GameProvider(),

        ),

        ChangeNotifierProvider(

          create: (_) => IdiomaProvider(),

        ),

         ChangeNotifierProvider(
      create: (_) => AuthProvider(),
    ),

      ],

      child: MaterialApp(

        debugShowCheckedModeBanner: false,

        title: 'Aplicacion de idiomas',

        home: const SplashScreen(),

      ),

    );

  }

}