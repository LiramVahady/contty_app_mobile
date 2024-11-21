class BuissinesCategory {
  String id;
  String name;
  bool isAprooved;

  BuissinesCategory({
    required this.id,
    required this.name,
    required this.isAprooved,
  });

  factory BuissinesCategory.fromJson(Map<String, dynamic> json) =>
      BuissinesCategory(
        id: json["id"],
        name: json["name"],
        isAprooved: json["isAprooved"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "isAprooved": isAprooved,
      };
}
