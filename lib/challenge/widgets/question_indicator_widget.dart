import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentQuestion;
  final int totalQuestions;
  const QuestionIndicatorWidget({
    Key? key,
    required this.currentQuestion,
    required this.totalQuestions,
  })   : assert(
          currentQuestion >= 0,
          totalQuestions >= currentQuestion,
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Questão $currentQuestion',
                    style: AppTextStyles.heading15),
                Text('de $totalQuestions', style: AppTextStyles.heading15),
              ],
            ),
            SizedBox(height: 16),
            ProgressIndicatorWidget(
              value: currentQuestion / totalQuestions,
            ),
          ],
        ),
      ),
    );
  }
}
