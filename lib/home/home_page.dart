import 'package:devquiz/core/app_constants.dart';
import 'package:devquiz/home/widgets/app_bar_widget.dart';
import 'package:devquiz/home/widgets/level_button_widget.dart';
import 'package:devquiz/home/widgets/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LevelButtonWidget(label: AppConstants.easy),
                LevelButtonWidget(label: AppConstants.medium),
                LevelButtonWidget(label: AppConstants.hard),
                LevelButtonWidget(label: AppConstants.expert),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  QuizCardWidget(currentQuestion: 3),
                  QuizCardWidget(currentQuestion: 0),
                  QuizCardWidget(currentQuestion: 8),
                  QuizCardWidget(currentQuestion: 5),
                  QuizCardWidget(currentQuestion: 0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}