import 'package:equatable/equatable.dart';

abstract class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object?> get props => [];
}

class QuizInitial extends QuizState {}

class QuizLoaded extends QuizState {
  final int currentQuestionIndex;
  final String? feedbackMessage;

  const QuizLoaded({
    required this.currentQuestionIndex,
    this.feedbackMessage,
  });

  @override
  List<Object?> get props => [currentQuestionIndex, feedbackMessage];
}