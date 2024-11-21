import 'dart:convert';

class CurrentUser {
  String id;
  String username;

  String hashedPassword;
  String salt;
  String password;
  bool admin;
  String email;
  DateTime createdAt;
  String provider;

  CurrentUser({
    required this.id,
    required this.username,
    required this.hashedPassword,
    required this.salt,
    required this.password,
    required this.admin,
    required this.email,
    required this.createdAt,
    required this.provider,
  });

  factory CurrentUser.fromJson(Map<String, dynamic> json) => CurrentUser(
        id: json["id"],
        username: json["username"],
        hashedPassword: json["hashedPassword"],
        salt: json["salt"],
        password: json["password"],
        admin: json["admin"],
        email: json["email"],
        createdAt: DateTime.parse(json["createdAt"]),
        provider: json["provider"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "hashedPassword": hashedPassword,
        "salt": salt,
        "password": password,
        "admin": admin,
        "email": email,
        "createdAt": createdAt.toIso8601String(),
        "provider": provider,
      };
}

class UserInfo {
  String fullName;
  String businessName;
  String targetAudience;
  bool agreedToTerms;
  String businessCategory;
  String description;
  String? userId;

  UserInfo({
    required this.fullName,
    required this.businessName,
    required this.targetAudience,
    required this.agreedToTerms,
    required this.businessCategory,
    required this.description,
    required this.userId,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        fullName: json["fullName"],
        businessName: json["businessName"],
        targetAudience: json["targetAudience"],
        agreedToTerms: json["agreedToTerms"],
        businessCategory: json["businessCategory"],
        description: json["description"],
        userId: json["userId"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "businessName": businessName,
        "targetAudience": targetAudience,
        "agreedToTerms": agreedToTerms,
        "businessCategory": businessCategory,
        "description": description,
        "userId": userId ?? "",
      };
}

class TargetAudience {
  TargetAudience();

  factory TargetAudience.fromJson(Map<String, dynamic> json) =>
      TargetAudience();

  Map<String, dynamic> toJson() => {};
}
