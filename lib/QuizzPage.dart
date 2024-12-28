import 'package:flutter/material.dart';

class QuizzPage extends StatefulWidget {
  const QuizzPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<QuizzPage> createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  // Updated questions
  final List<Question> _questions = [
    Question(
      text: "La Tour Eiffel se trouve à Rome.",
      isCorrect: false,
      imageUrl: "https://images.pexels.com/photos/587842/pexels-photo-587842.jpeg?cs=srgb&dl=eiffel-tower-france-paris-summer-587842.jpg&fm=jpg",
    ),
    Question(
      text: "La Grande Muraille de Chine est visible depuis l’espace sans aide.",
      isCorrect: false,
      imageUrl: "https://th.bing.com/th/id/OIP.BrKujUKqMLiujla2zr0S9QHaE6?rs=1&pid=ImgDetMain",
    ),
    Question(
      text: "La forêt amazonienne produit 20 % de l’oxygène mondial.",
      isCorrect: true,
      imageUrl: "https://th.bing.com/th/id/R.fc8159ba52eaf9c690856ffbfba57db5?rik=gKfVXV1WDumz2w&pid=ImgRaw&r=0",
    ),
    Question(
      text: "Les baleines sont des mammifères.",
      isCorrect: true,
      imageUrl: "https://th.bing.com/th/id/R.915b126126dfa2cc76b2171299926be1?rik=SEO06PBOtK2zSQ&pid=ImgRaw&r=0",
    ),
    Question(
      text: "Le mont Everest est la montagne la plus haute de la Terre.",
      isCorrect: true,
      imageUrl: "https://th.bing.com/th/id/R.2bbfd41f48d7b0a8679092bd5384287e?rik=OZjAMLQRTuaekw&pid=ImgRaw&r=0",
    ),
  ];

  int _currentQuestionIndex = 0;
  String? _feedbackMessage;

  void _checkAnswer(bool userChoice) {
    final currentQuestion = _questions[_currentQuestionIndex];

    setState(() {
      if (userChoice == currentQuestion.isCorrect) {
        _feedbackMessage = "Correct!";
      } else {
        _feedbackMessage = "'Faux!";
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % _questions.length;
      _feedbackMessage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = _questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
              onPressed: () => _checkAnswer(true),
              child: const Text("Vrai"),
            ),
            ElevatedButton(
              onPressed: () => _checkAnswer(false),
              child: const Text("Faux"),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _nextQuestion,
              child: const Text("Question suivant"),
            ),
            if (_feedbackMessage != null)
              Column(
                children: [
                  const SizedBox(height: 20.0),
                  Text(
                    _feedbackMessage!,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: _feedbackMessage == "Correct!" ? Colors.green : Colors.red,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: _nextQuestion,
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

class Question {
  final String text;
  final bool isCorrect;
  final String? imageUrl;

  Question({required this.text, required this.isCorrect, this.imageUrl});
}
