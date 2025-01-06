import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Providers/QuizzProvider.dart'; // Import the QuizProvider

class QuizzPage extends StatelessWidget {
  const QuizzPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);
    final currentQuestion = quizProvider.questions[quizProvider.currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      backgroundColor: Colors.blueGrey,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (currentQuestion.imageUrl != null)
              Image.network(
                currentQuestion.imageUrl!,
                height: 200,
                fit: BoxFit.cover,
              ),
            const SizedBox(height: 20.0),
            Text(
              currentQuestion.text,
              style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => quizProvider.checkAnswer(true),
              child: const Text("Vrai"),
            ),
            ElevatedButton(
              onPressed: () => quizProvider.checkAnswer(false),
              child: const Text("Faux"),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: quizProvider.nextQuestion,
              child: const Text("Question suivant"),
            ),
            if (quizProvider.feedbackMessage != null)
              Column(
                children: [
                  const SizedBox(height: 20.0),
                  Text(
                    quizProvider.feedbackMessage!,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: quizProvider.feedbackMessage == "Correct!" ? Colors.green : Colors.red,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: quizProvider.nextQuestion,
                    child: const Text("Question suivant"),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}