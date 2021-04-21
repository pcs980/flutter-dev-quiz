import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final int answeredQuestions;
  final int totalQuestions;
  final String image;
  QuizCardWidget({
    Key? key,
    required this.title,
    required this.answeredQuestions,
    required this.totalQuestions,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
          borderRadius: BorderRadius.circular(10),
          color: AppColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: 40,
              color: AppColors.red,
              child: Image.asset(image),
            ),
            SizedBox(height: 25),
            Text(title, style: AppTextStyles.heading15),
            SizedBox(height: 25),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text('$answeredQuestions de $totalQuestions',
                      style: AppTextStyles.body11),
                ),
                Expanded(
                  flex: 3,
                  child: ProgressIndicatorWidget(
                    value: answeredQuestions / totalQuestions,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
