import 'package:equatable/equatable.dart';

abstract class QuizEvent extends Equatable {
  const QuizEvent();

  @override
  List<Object?> get props => [];
}

class CheckAnswerEvent extends QuizEvent {
  final bool userChoice;

  const CheckAnswerEvent(this.userChoice);

  @override
  List<Object?> get props => [userChoice];
}

class NextQuestionEvent extends QuizEvent {}