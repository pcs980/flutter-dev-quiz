import 'package:devquiz/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color borderColor;
  final Color fontColor;
  final Color overlayColor;
  final VoidCallback onTap;

  NextButtonWidget({
    Key? key,
    required this.label,
    required this.backgroundColor,
    required this.borderColor,
    required this.fontColor,
    required this.overlayColor,
    required this.onTap,
  }) : super(key: key);

  NextButtonWidget.purple(
    String label, {
    required onTap,
  })   : this.backgroundColor = AppColors.purple,
        this.borderColor = AppColors.purple,
        this.fontColor = AppColors.white,
        this.overlayColor = AppColors.purple,
        this.onTap = onTap,
        this.label = label;

  NextButtonWidget.green(
    String label, {
    required onTap,
  })   : this.backgroundColor = AppColors.darkGreen,
        this.borderColor = AppColors.darkGreen,
        this.fontColor = AppColors.white,
        this.overlayColor = AppColors.lightGreen,
        this.onTap = onTap,
        this.label = label;

  NextButtonWidget.white(
    String label, {
    required onTap,
  })   : this.backgroundColor = AppColors.white,
        this.borderColor = AppColors.border,
        this.fontColor = AppColors.grey,
        this.overlayColor = AppColors.lightGrey,
        this.onTap = onTap,
        this.label = label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 48,
      child: TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(fontColor),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          side: MaterialStateProperty.all(BorderSide(
            color: borderColor,
          )),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )),
        ),
        onPressed: onTap,
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
