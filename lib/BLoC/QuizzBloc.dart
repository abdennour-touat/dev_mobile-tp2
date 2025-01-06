import 'package:flutter_bloc/flutter_bloc.dart';
import '../Question.dart';
import 'QuizzEvent.dart';
import 'QuizzState.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
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

  // Public getter for _questions
  List<Question> get questions => _questions;

  QuizBloc() : super(QuizInitial()) {
    on<CheckAnswerEvent>(_onCheckAnswer);
    on<NextQuestionEvent>(_onNextQuestion);
  }

  void _onCheckAnswer(CheckAnswerEvent event, Emitter<QuizState> emit) {
    final currentQuestion = _questions[state is QuizLoaded ? (state as QuizLoaded).currentQuestionIndex : 0];
    final feedbackMessage = event.userChoice == currentQuestion.isCorrect ? "Correct!" : "Faux!";

    emit(QuizLoaded(
      currentQuestionIndex: state is QuizLoaded ? (state as QuizLoaded).currentQuestionIndex : 0,
      feedbackMessage: feedbackMessage,
    ));
  }

  void _onNextQuestion(NextQuestionEvent event, Emitter<QuizState> emit) {
    final currentIndex = state is QuizLoaded ? (state as QuizLoaded).currentQuestionIndex : 0;
    final nextIndex = (currentIndex + 1) % _questions.length;

    emit(QuizLoaded(
      currentQuestionIndex: nextIndex,
      feedbackMessage: null,
    ));
  }
}