import 'dart:convert';

class PostModel {
  final String coverImage;
  final String title;
  final String contentMarkdown;

  PostModel({
    required this.coverImage,
    required this.title,
    required this.contentMarkdown,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'coverImage': coverImage,
      'title': title,
      'contentMarkdown': contentMarkdown,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      coverImage: map['coverImage'] as String,
      title: map['title'] as String,
      contentMarkdown: map['contentMarkdown'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
