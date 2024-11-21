class GeneratePost {
  String id;
  String title;
  String content;
  String imageUrl;
  String userId;
  DateTime createdAt;
  DateTime updatedAt;

  GeneratePost({
    required this.id,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory GeneratePost.fromJson(Map<String, dynamic> json) => GeneratePost(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        imageUrl: json["imageUrl"],
        userId: json["userId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "imageUrl": imageUrl,
        "userId": userId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
