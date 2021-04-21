import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  const QuestionIndicatorWidget({Key? key}) : super(key: key);

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
                Text('Questão 4', style: AppTextStyles.heading15),
                Text('de 10', style: AppTextStyles.heading15),
              ],
            ),
            SizedBox(height: 16),
            ProgressIndicatorWidget(
              value: 0.4,
            ),
          ],
        ),
      ),
    );
  }
}
