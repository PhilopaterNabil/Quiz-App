class QuizQuestion {
  final String question;
  final List<String> answers;

  List<String> get shuffledAnswers {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }

  QuizQuestion({
    required this.question,
    required this.answers,
  });
}
