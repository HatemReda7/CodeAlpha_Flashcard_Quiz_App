import 'package:flutter/material.dart';
import '../preference_helper.dart';

class MyProvider extends ChangeNotifier{
  int quizScore=0;
  int numOfQuestions=0;
  int totalNumOfQuestions=0;
  int totalNumOfCorrectAnswers=0;

  void init()async{
    int? currentScore= PrefsHelper.getCurrentScore();
    changeCurrentScore(currentScore??0);

    int? currentNumOfQuestions= PrefsHelper.getCurrentNumOfQuestions();
    changeCurrentNumOfQuestions(currentNumOfQuestions??0);

    int? totalNumOfQuestions= PrefsHelper.getTotalNumOfQuestions();
    changeTotalNumOfQuestions(totalNumOfQuestions??0);

    int? totalNumOfCorrectAnswers= PrefsHelper.getTotalNumOfCorrectAnswers();
    changeTotalNumOfCorrectAnswers(totalNumOfCorrectAnswers??0);
  }

  void changeCurrentScore(int score){
    quizScore=score;
    PrefsHelper.saveCurrentScore(score);
    notifyListeners();
  }

  void changeCurrentNumOfQuestions(int num){
    numOfQuestions=num;
    PrefsHelper.saveCurrentNumOfQuestions(num);
    notifyListeners();
  }

  void changeTotalNumOfQuestions(int num){
    totalNumOfQuestions+=num;
    PrefsHelper.saveTotalNumOfQuestions(totalNumOfQuestions);
    notifyListeners();
  }

  void changeTotalNumOfCorrectAnswers(int num){
    totalNumOfCorrectAnswers+=num;
    PrefsHelper.saveTotalNumOfCorrectAnswers(totalNumOfCorrectAnswers);
    notifyListeners();
  }
}