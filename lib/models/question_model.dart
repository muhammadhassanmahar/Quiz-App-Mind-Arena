class QuestionModel {

  final String id;
  final String question;
  final List<String> options;
  final String correctAnswer;
  final int contestType; // 100 / 500 / 1000

  QuestionModel({
    required this.id,
    required this.question,
    required this.options,
    required this.correctAnswer,
    required this.contestType,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json["_id"] ?? "",
      question: json["question"] ?? "",
      options: List<String>.from(json["options"] ?? []),
      correctAnswer: json["correct_answer"] ?? "",
      contestType: json["contest_type"] ?? 100,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "question": question,
      "options": options,
      "correct_answer": correctAnswer,
      "contest_type": contestType,
    };
  }
}