class QuizModel{
  String id;
  int correctAnswersCounter;
  int numOfQuestions;

  QuizModel(
      {this.id = "",
        required this.correctAnswersCounter,required this.numOfQuestions});

  QuizModel.fromJson(Map<String, dynamic> json) : this(
    id: json["id"],
    correctAnswersCounter: json["correctAnswersCounter"],
    numOfQuestions: json["numOfQuestions"],
  );

  Map<String,dynamic> toJson(){
    return {
      "id": id,
      "correctAnswersCounter": correctAnswersCounter,
      "numOfQuestions": numOfQuestions,
    };
  }
}