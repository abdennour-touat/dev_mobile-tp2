import 'package:flutter/material.dart';
import 'package:untitled/QuizzPage.dart';

import 'ProfileHomePage.dart';

void main() => runApp(MyApp()); // Point d'entrée

// Le widget racine de notre application
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My First Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Couleur principale
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: const ProfileHomePage(), // Widget de la page d'accueil
      home:const QuizzPage(title: "Quizz"),
    );
  }
}


