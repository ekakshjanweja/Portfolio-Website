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
      coverImage: map['node']['coverImage']['url'] as String,
      title: map['node']['title'] as String,
      contentMarkdown: map['node']['content']['markdown'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
