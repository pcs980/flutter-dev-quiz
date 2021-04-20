import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerWidget extends StatelessWidget {
  final String answer;
  final bool isChecked;
  final bool isCorrect;
  AnswerWidget({
    Key? key,
    required this.answer,
    this.isChecked = false,
    this.isCorrect = false,
  }) : super(key: key);

  Color get _checkedColorCorrect =>
      isCorrect ? AppColors.darkGreen : AppColors.darkRed;
  Color get _checkedBorderCorrect =>
      isCorrect ? AppColors.lightGreen : AppColors.lightRed;
  Color get _checkedColorCardCorrect =>
      isCorrect ? AppColors.lightGreen : AppColors.lightRed;
  Color get _checkedBorderCardCorrect =>
      isCorrect ? AppColors.green : AppColors.red;
  TextStyle get _checkedTextStyleCorrect =>
      isCorrect ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;
  IconData get _checkedIconCorrect => isCorrect ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isChecked ? _checkedColorCardCorrect : AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.fromBorderSide(
            BorderSide(
                color:
                    isChecked ? _checkedBorderCardCorrect : AppColors.border),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                answer,
                style:
                    isChecked ? _checkedTextStyleCorrect : AppTextStyles.body,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: isChecked ? _checkedColorCorrect : AppColors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.fromBorderSide(
                  BorderSide(
                      color:
                          isChecked ? _checkedBorderCorrect : AppColors.border),
                ),
              ),
              height: 24,
              width: 24,
              child: isChecked
                  ? Icon(
                      _checkedIconCorrect,
                      color: AppColors.white,
                      size: 16,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
