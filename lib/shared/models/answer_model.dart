import 'dart:convert';

class AnswerModel {
  final String title;
  final bool isCorret;

  AnswerModel({
    required this.title,
    this.isCorret = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isCorret': isCorret,
    };
  }

  factory AnswerModel.fromMap(Map<String, dynamic> map) {
    return AnswerModel(
      title: map['title'],
      isCorret: map['isCorret'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnswerModel.fromJson(String source) =>
      AnswerModel.fromMap(json.decode(source));
}
