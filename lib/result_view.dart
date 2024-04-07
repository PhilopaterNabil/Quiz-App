import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/summary.dart';

class ResultView extends StatelessWidget {
  const ResultView(
    this.selectedAnswers,
    this.onRestart, {
    super.key,
  });

  final List<String> selectedAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> get _summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'selected_answer': selectedAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    int numCorrectQuestions = _summaryData
        .where((element) =>
            element['selected_answer'] == element['correct_answer'])
        .length;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Summary(summaryData: _summaryData),
          const SizedBox(height: 24),
          TextButton.icon(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.deepPurple[900],
              padding: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: onRestart,
            icon: const Icon(
              Icons.refresh,
              color: Color.fromARGB(255, 250, 205, 254),
            ),
            label: const Text(
              'Restart Quiz!',
              style: TextStyle(
                color: Color.fromARGB(255, 250, 205, 254),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
