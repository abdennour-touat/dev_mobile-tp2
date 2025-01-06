import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'BLoC/QuizzBloc.dart';
import 'BLoC/QuizzEvent.dart';
import 'BLoC/QuizzState.dart';


class QuizzPage_BLoC extends StatelessWidget {
  const QuizzPage_BLoC({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        backgroundColor: Colors.blueGrey,
        body: BlocBuilder<QuizBloc, QuizState>(
          builder: (context, state) {
            if (state is QuizInitial || state is QuizLoaded) {
              final currentQuestionIndex = state is QuizLoaded ? state.currentQuestionIndex : 0;
              final feedbackMessage = state is QuizLoaded ? state.feedbackMessage : null;
              final currentQuestion = (context.read<QuizBloc>().questions)[currentQuestionIndex];

              return Padding(
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
                      onPressed: () => context.read<QuizBloc>().add(CheckAnswerEvent(true)),
                      child: const Text("Vrai"),
                    ),
                    ElevatedButton(
                      onPressed: () => context.read<QuizBloc>().add(CheckAnswerEvent(false)),
                      child: const Text("Faux"),
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () => context.read<QuizBloc>().add(NextQuestionEvent()),
                      child: const Text("Question suivant"),
                    ),
                    if (feedbackMessage != null)
                      Column(
                        children: [
                          const SizedBox(height: 20.0),
                          Text(
                            feedbackMessage,
                            style: TextStyle(
                              fontSize: 18.0,
                              color: feedbackMessage == "Correct!" ? Colors.green : Colors.red,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20.0),
                          ElevatedButton(
                            onPressed: () => context.read<QuizBloc>().add(NextQuestionEvent()),
                            child: const Text("Question suivant"),
                          ),
                        ],
                      ),
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}