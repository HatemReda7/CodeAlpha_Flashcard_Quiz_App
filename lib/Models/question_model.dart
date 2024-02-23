class QuestionModel {
  String id;
  String question;
  String answer;
  bool isDone;

  QuestionModel(
      {this.id = "",
      required this.question,
      required this.answer,
      this.isDone = false});

  QuestionModel.fromJson(Map<String, dynamic> json) : this(
    id: json["id"],
    question: json["question"],
    answer: json["answer"],
    isDone: json["isDone"],
  );

  Map<String,dynamic> toJson(){
    return {
    "id": id,
    "question": question,
    "answer": answer,
    "isDone": isDone,
    };
  }
  /*QuestionModel fromJson(Map<String, dynamic> json) {
    return QuestionModel(
        question: json["question"],
        answer: json["answer"],
        isDone: json["isDone"],
        id: json["id"]);
  }*/
}
