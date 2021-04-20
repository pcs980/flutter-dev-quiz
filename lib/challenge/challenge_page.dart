import 'package:devquiz/challenge/widgets/answer_widget.dart';
import 'package:devquiz/challenge/widgets/question_indicator_widget.dart';
import 'package:devquiz/challenge/widgets/quiz_widget.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  ChallengePage({Key? key}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: PreferredSize(
            child: SafeArea(
              top: true,
              child: QuestionIndicatorWidget(),
            ),
            preferredSize: Size.fromHeight(80)),
        body: QuizWidget(title: 'O que o Flutter faz em sua totalidade?'),
      ),
    );
  }
}
