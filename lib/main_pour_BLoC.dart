import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/BLoC/QuizzBloc.dart'; // Import the QuizBloc
import 'QuizzPage_BLoC.dart'; // Import the QuizzPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const QuizzPage_BLoC(title: 'Quiz App'),
    );
  }
}