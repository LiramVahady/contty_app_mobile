import 'package:contty_app/models/service/user.dart';

class SharedUser {
  // Private constructor to prevent instantiation
  SharedUser._();
  CurrentUser? _currentUser;
  UserInfo? _userInfo;
  // The single instance of the User class
  static final SharedUser _instance = SharedUser._();

  // Access the singleton instance
  static SharedUser get instance => _instance;

  // Properties of the User

  // Method to update the user instance
  void updateUser(Map<String, dynamic> userJson) {
    final cUser = CurrentUser.fromJson(userJson);
    _currentUser = cUser;
  }

  void setUsetInfo(UserInfo uInfo) {
    _userInfo = uInfo;
  }

  //Getter
  CurrentUser? get currentUser {
    return _currentUser;
  }

  UserInfo? get userInfo {
    return _userInfo;
  }
}
