import 'package:devquiz/challenge/challenge_controller.dart';
import 'package:devquiz/challenge/widgets/next_button_widget.dart';
import 'package:devquiz/challenge/widgets/question_indicator_widget.dart';
import 'package:devquiz/challenge/widgets/quiz_widget.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  ChallengePage({
    Key? key,
    required this.questions,
  }) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final questionController = PageController();

  @override
  void initState() {
    super.initState();
    questionController.addListener(() {
      controller.currentQuestion = questionController.page!.toInt();
    });
  }

  void nextPage() {
    if (controller.currentQuestion < widget.questions.length - 1) {
      questionController.nextPage(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(130),
          child: SafeArea(
            top: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                ValueListenableBuilder<int>(
                  valueListenable: controller.currentQuestionNotifier,
                  builder: (context, value, _) => QuestionIndicatorWidget(
                    currentQuestion: value + 1,
                    totalQuestions: widget.questions.length,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: questionController,
          children: widget.questions
              .map((q) => QuizWidget(
                    question: q,
                    onChanged: nextPage,
                  ))
              .toList(),
        ),
        bottomNavigationBar: SafeArea(
          bottom: true,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            child: ValueListenableBuilder<int>(
              valueListenable: controller.currentQuestionNotifier,
              builder: (context, value, _) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (value < widget.questions.length - 1)
                    Expanded(
                      child: NextButtonWidget.white(
                        'Próximo',
                        onTap: nextPage,
                      ),
                    ),
                  if (value == widget.questions.length - 1)
                    Expanded(
                      child: NextButtonWidget.green(
                        'Finalizar',
                        onTap: () {},
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
