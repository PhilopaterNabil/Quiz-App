import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/question.dart';

class QuestionsViewBody extends StatefulWidget {
  const QuestionsViewBody({super.key, required this.onSelectAnswer});

  final void Function(String) onSelectAnswer;

  @override
  State<QuestionsViewBody> createState() => _QuestionsViewBodyState();
}

class _QuestionsViewBodyState extends State<QuestionsViewBody> {
  var currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    widget.onSelectAnswer(answer);
    if (currentQuestionIndex < questions.length) {
      setState(() {
        currentQuestionIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currenQuestion = questions[currentQuestionIndex];
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currenQuestion.question,
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 250, 205, 254),
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          ...currenQuestion.shuffledAnswers.map(
                (answer) => Container(
                  margin: const EdgeInsets.all(5),
                  child: AnswerButton(
                    answerText: answer,
                    onPressed: () => answerQuestion(answer),
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
