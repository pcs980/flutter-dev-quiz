import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/models/answer_model.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final AnswerModel answer;
  final VoidCallback onTap;
  final bool isChecked;
  final bool disabled;

  AnswerWidget({
    Key? key,
    required this.answer,
    required this.onTap,
    this.isChecked = false,
    this.disabled = false,
  }) : super(key: key);

  Color get _checkedColorCorrect =>
      answer.isCorrect ? AppColors.darkGreen : AppColors.darkRed;
  Color get _checkedBorderCorrect =>
      answer.isCorrect ? AppColors.lightGreen : AppColors.lightRed;
  Color get _checkedColorCardCorrect =>
      answer.isCorrect ? AppColors.lightGreen : AppColors.lightRed;
  Color get _checkedBorderCardCorrect =>
      answer.isCorrect ? AppColors.green : AppColors.red;
  TextStyle get _checkedTextStyleCorrect => answer.isCorrect
      ? AppTextStyles.bodyDarkGreen
      : AppTextStyles.bodyDarkRed;
  IconData get _checkedIconCorrect =>
      answer.isCorrect ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: disabled,
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isChecked ? _checkedColorCardCorrect : AppColors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.fromBorderSide(
                BorderSide(
                    color: isChecked
                        ? _checkedBorderCardCorrect
                        : AppColors.border),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    answer.title,
                    style: isChecked
                        ? _checkedTextStyleCorrect
                        : AppTextStyles.body,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: isChecked ? _checkedColorCorrect : AppColors.white,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.fromBorderSide(
                      BorderSide(
                          color: isChecked
                              ? _checkedBorderCorrect
                              : AppColors.border),
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
        ),
      ),
    );
  }
}
