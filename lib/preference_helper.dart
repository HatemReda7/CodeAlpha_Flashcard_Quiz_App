import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper {
  static late SharedPreferences prefs;

  static int? getTotalNumOfQuestions() {
    return prefs.getInt("Total Num Of Questions");
  }

  static saveTotalNumOfQuestions(int num) async {
    await prefs.setInt("Total Num Of Questions", num);
  }

  static int? getTotalNumOfCorrectAnswers() {
    return prefs.getInt("Total Num Of Correct Answers");
  }

  static saveTotalNumOfCorrectAnswers(int num) async {
    await prefs.setInt("Total Num Of Correct Answers", num);
  }

  static int? getCurrentNumOfQuestions() {
    return prefs.getInt("Current Num Of Questions");
  }

  static saveCurrentNumOfQuestions(int num) async {
    await prefs.setInt("Current Num Of Questions", num);
  }

  static saveCurrentScore(int currentScore) async {
    await prefs.setInt("Current Score", currentScore);
  }

  static int? getCurrentScore() {
    return prefs.getInt("Current Score");
  }
}
