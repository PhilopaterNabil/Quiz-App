import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/home_view_body.dart';
import 'package:quiz_app/questions_view.dart';
import 'package:quiz_app/result_view.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  Widget? activeScreen;

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultView(selectedAnswers, restartQuiz);
        selectedAnswers = [];
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = HomeViewBody(switchScreen);
    });
  }

  @override
  void initState() {
    super.initState();
    activeScreen = HomeViewBody(switchScreen);
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsViewBody(onSelectAnswer: chooseAnswer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz',
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.deepPurpleAccent,
              Colors.purpleAccent,
            ]),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
