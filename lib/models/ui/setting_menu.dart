import 'package:contty_app/routes/routes.dart';

class SettingMenuData {
  final String title;

  SettingMenuData({required this.title});

  String get imagePath {
    String path = "assets/images/icons";
    switch (title) {
      case "profile":
        return "$path/favorite.png";
      case "privacy":
        return "$path/privacy.png";
      case "rate":
        return "$path/favorite.png";
      case "terms":
        return "$path/terms.png";
      case "contact":
        return "$path/contact.png";
      default:
        return "";
    }
  }

  String get hebrewTitle {
    switch (title) {
      case "profile":
        return "הפרופיל שלי";
      case "privacy":
        return "התראות ופרטיות";
      case "rate":
        return "דרגו את contty";
      case "terms":
        return "תנאי שימוש";
      case "contact":
        return "צור קשר";
      case "Logout":
        return "התנתק";
      default:
        return "";
    }
  }

  String get routeName {
    switch (title) {
      case "profile":
        return Routes.privacySetting;
      case "privacy":
        return Routes.privacySetting;
      case "rate":
        return "";
      case "terms":
        return "";
      case "contact":
        return "";
      case "Logout":
        return "Logout";
      default:
        return "";
    }
  }
}
