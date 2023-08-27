class QuizUserAnswer {
  const QuizUserAnswer({
    required this.questionNumber,
    required this.question,
    required this.correctAnswer,
    required this.userAnswer,
  });

  final int questionNumber;
  final String question;
  final String correctAnswer;
  final String userAnswer;

  bool isCorrect() {
    return correctAnswer == userAnswer;
  }
}
