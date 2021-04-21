import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:devquiz/shared/models/user_model.dart';
import 'package:flutter/cupertino.dart';

import 'home_respository.dart';
import 'home_state.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.vazio);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizes;

  final repository = HomeRepository();

  void getUser() async {
    state = HomeState.carregando;
    user = await repository.getUser();
  }

  void getQuizes() async {
    quizes = await repository.getQuizes();
    state = HomeState.sucesso;
  }
}
