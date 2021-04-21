import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_constants.dart';
import 'package:devquiz/home/home_state.dart';
import 'package:devquiz/home/widgets/app_bar_widget.dart';
import 'package:devquiz/home/widgets/level_button_widget.dart';
import 'package:devquiz/home/widgets/quiz_card_widget.dart';
import 'package:flutter/material.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizes();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.sucesso) {
      return Scaffold(
        appBar: AppBarWidget(user: controller.user!),
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
                  children: controller.quizes!
                      .map((q) => QuizCardWidget(
                            title: q.title,
                            answeredQuestions: q.answeredQuestions,
                            totalQuestions: q.questions.length,
                            image: q.image,
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
          body: Center(
              child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
        strokeWidth: 3,
      )));
    }
  }
}
