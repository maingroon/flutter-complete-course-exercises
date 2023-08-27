import 'package:adv_basics/models/quiz_user_answer.dart';
import 'package:adv_basics/models/quiz_question.dart';
import 'package:adv_basics/results_screen.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  static const String startScreenName = 'start-screen';
  static const String questionsScreenName = 'questions-screen';
  static const String answersScreenName = 'answers-screen';

  String activeScreenName = startScreenName;

  List<String> selectedAnswers = [];

  void switchToQuestionsScreen() {
    if (activeScreenName == questionsScreenName) {
      return;
    }
    setState(() {
      activeScreenName = questionsScreenName;
    });
  }

  void switchToAnswersScreen() {
    if (activeScreenName == answersScreenName) {
      return;
    }
    setState(() {
      activeScreenName = answersScreenName;
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length >= questions.length) {
      switchToAnswersScreen();
    }
  }

  void restartQuiz() {
    selectedAnswers = [];
    switchToQuestionsScreen();
  }

  List<QuizUserAnswer> buildUserAnswers() {
    final List<QuizUserAnswer> userAnswers = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      final QuizQuestion question = questions[i];
      final QuizUserAnswer userAnswer = QuizUserAnswer(
        questionNumber: i + 1,
        question: question.question,
        correctAnswer: question.answers[0],
        userAnswer: selectedAnswers[i],
      );
      userAnswers.add(userAnswer);
    }

    return userAnswers;
  }

  Widget _getActiveScreen() {
    switch (activeScreenName) {
      case startScreenName:
        return StartScreen(
          onStartQuiz: switchToQuestionsScreen,
        );
      case questionsScreenName:
        return QuestionsScreen(
          onSelectAnswer: chooseAnswer,
        );
      case answersScreenName:
        return ResultsScreen(
          userAnswers: buildUserAnswers(),
          onRestartQuiz: restartQuiz,
        );
      default:
        throw Exception('Invalid active screen name!');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Widget activeScreen = _getActiveScreen();

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black54,
        body: activeScreen,
      ),
    );
  }

  @override
  void dispose() {
    print('disposed quiz');
    super.dispose();
  }
}
