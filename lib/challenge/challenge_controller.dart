import 'package:flutter/cupertino.dart';

class ChallengeController {
  final currentQuestionNotifier = ValueNotifier<int>(0);
  final correctAnswersNotifier = ValueNotifier<int>(0);
  int correctAnswerCount = 0;

  int get currentQuestion => currentQuestionNotifier.value;
  set currentQuestion(int value) => currentQuestionNotifier.value = value;

  int get correctAnswers => correctAnswersNotifier.value;
  set correctAnswers(int value) => correctAnswersNotifier.value = value;
}
