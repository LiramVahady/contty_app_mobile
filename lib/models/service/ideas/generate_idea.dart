class GenerateIdea {
  String id;
  String title;
  String userId;
  DateTime createdAt;
  DateTime updatedAt;

  GenerateIdea({
    required this.id,
    required this.title,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory GenerateIdea.fromJson(Map<String, dynamic> json) => GenerateIdea(
        id: json["id"],
        title: json["title"],
        userId: json["userId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "userId": userId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
