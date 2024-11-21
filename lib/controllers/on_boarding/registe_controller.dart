import 'package:contty_app/globals/contants_values.dart';
import 'package:contty_app/service/error_handler.dart';
import 'package:contty_app/models/service/register_request.dart';
import 'package:contty_app/models/service/user.dart';
import 'package:contty_app/models/ui/register_fields_state.dart';
import 'package:contty_app/service/http_response.dart';
import 'package:contty_app/service/http_service.dart';
import 'package:contty_app/singelton/shared_user.dart';
import 'package:contty_app/utils/json_parser.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationController extends StateNotifier<RegisterState> {
  final GetIt _getIt = GetIt.instance;
  late HttpService _httpService;
  final String serverError = "";

  AuthenticationController() : super(RegisterState()) {
    _httpService = _getIt.get<HttpService>();
  }

  void updateEmail(String email) {
    state = state.copyWith(
      email: email,
      emailError: null, // Clear error when user types
    );
  }

  void updatePassword(String password) {
    state = state.copyWith(
        password: password, passwordError: null, strenghPaswword: null);
  }

  // void updateRepeatPassword(String repeatPassword) {
  //   state = state.copyWith(repeatPassword: repeatPassword);
  // }

  void updatePasswordStrengh(String? passwordStrength) {
    state = state.copyWith(strenghPaswword: passwordStrength);
  }

  void updateRepeatPassword(String? repass) {
    state = state.copyWith(repeatPassword: repass);
  }

  // void updateUser(User user) {
  //   state = state.copyWith(user: user);
  // }

  bool validateEmail() {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(state.email)) {
      state = state.copyWith(emailError: "הזן אימייל"); // Set error if invalid
      return false;
    } else {
      state = state.copyWith(emailError: null); // Clear error if valid
      return true;
    }
  }

  void checkPasswordStrength(String password) {
    // Check for minimum length
    if (password.isEmpty) {
      updatePasswordStrengh(null);
      return;
    }
    if (password.length <= 6) {
      updatePasswordStrengh("weak");
      return;
    }

    // Check for a mix of letters and numbers
    bool hasLetters = password.contains(RegExp(r'[A-Za-z]'));
    bool hasNumbers = password.contains(RegExp(r'[0-9]'));

    // Check for sequential numbers like "12345" or "6789"
    if (hasSequentialNumbers(password)) {
      updatePasswordStrengh("weak");
    }

    // Determine strength
    if (hasLetters && hasNumbers) {
      updatePasswordStrengh("strong");
      return;
    } else if (hasLetters || hasNumbers) {
      updatePasswordStrengh("medium");
      return;
    } else {
      updatePasswordStrengh("weak");
      return;
    }
  }

  bool _validatePassword() {
    if (state.password.length < 6) {
      // state =
      //state.copyWith(passwordValidationError: "סיסמה קצרה - לפחות 6 תווים");
      return false;
    } else if (!RegExp(r'\d').hasMatch(state.password)) {
      //  state = state.copyWith(passwordValidationError: "לפחות מספר אחד");
      return false;
    }

    return true;
  }

  bool _repeastPasswordValidation() {
    if (state.password != state.repeatPassword) {
      state = state.copyWith(repeatPasswordError: "סיסמאות לא זהות");
      return false;
    }

    return true;
  }

  //-
  bool validateField() {
    final emailValid = validateEmail();
    final passwordValid = _validatePassword();
    final repeatPasswordValis = _repeastPasswordValidation();

    if (emailValid && passwordValid && repeatPasswordValis) {
      return true;
    }
    return false;
  }

  void repeatPasswordValidation() {
    // if (state.password != state.repeatPassword) {}
  }

  Future<HttpResult?> registerService() async {
    final body = RegisterRequest(
            username: "",
            password: state.password,
            firstName: "",
            lastName: "",
            email: state.email)
        .toJson();

    try {
      final Response? res =
          await _httpService.post(HTTPEntPoint.register, body);
      if (res != null && res.data != null) {
        //save token
        final _shared = await SharedPreferences.getInstance();
        final token = res.data["token"];
        final userJson = res.data["user"];
        _shared.setString("token", token);
        // updateUser(user);
        SharedUser.instance.updateUser(userJson);
        return HttpResult(errorMessage: null, data: res.data, isSuccess: true);
      }
    } catch (e) {
      if (e is CustomException) {
        return HttpResult(errorMessage: e.message, data: {}, isSuccess: false);
        // Show error dialog or toast with e.message
        //   _showErrorDialog(e.message);
      } else {
        return HttpResult(
            errorMessage: "קרתה שגיאה נסה מאוחר יותר",
            data: {},
            isSuccess: false);
        // For any other unexpected error
        // _showErrorDialog("An unexpected error occurred.");
      }
    }
  }

  //Login
  void reseTextError() {
    state = state.copyWith(password: null, passwordError: null);
  }

  Future<HttpResult?> login() async {
    if (state.email.isEmpty) {
      state = state.copyWith(emailError: "אימייל ריק");
      return null;
    } else if (state.password.isEmpty) {
      state = state.copyWith(passwordError: "סיסמה ריקה");
      return null;
    }
    try {
      final body = {"email": state.email, "password": state.password};
      final res = await _httpService.post(HTTPEntPoint.login, body);
      if (res != null && res.statusCode == 200) {
        reseTextError();
        state = state.copyWith(email: "");
        state = state.copyWith(password: "");
        final token = res.data["token"];
        final cUserJson = res.data["user"];
        //save token
        SharedPreferences shared = await SharedPreferences.getInstance();
        shared.setString("token", token);
        //save user
        SharedUser.instance.updateUser(cUserJson);
        //load user info

        //fetch user info

        return HttpResult(errorMessage: null, data: res.data, isSuccess: true);
      }
    } catch (e) {
      if (e is CustomException) {
        return HttpResult(errorMessage: e.message, data: {}, isSuccess: false);
        // Show error dialog or toast with e.message
        //   _showErrorDialog(e.message);
      } else {
        return HttpResult(
            errorMessage: "קרתה שגיאה נסה מאוחר יותר",
            data: {},
            isSuccess: false);
      }
    }
  }

  Future<HttpResult?> loadUserInfo(String id) async {
    try {
      final path = HTTPEntPoint.userInfoById.replaceAll("{id}", id);
      final response = await _httpService.get(path);
      if (response?.statusCode == 404) return null;
      final statusCode = response?.statusCode ?? 0;
      if (response?.data != null && statusCode >= 200 && statusCode <= 299) {
        final List<UserInfo> info = (response!.data as List<dynamic>)
            .map((user) => UserInfo.fromJson(user as Map<String, dynamic>))
            .toList();

        //if has info data:
        if (info.isNotEmpty) {
          SharedUser.instance.setUsetInfo(info.first);
          return HttpResult(
              errorMessage: null, data: info.first, isSuccess: true);
        }
        return HttpResult(errorMessage: null, data: null, isSuccess: true);
      }
    } catch (e) {
      return HttpResult(errorMessage: e.toString(), data: {}, isSuccess: false);
    }
  }

  bool hasSequentialNumbers(String password) {
    for (int i = 0; i < password.length - 1; i++) {
      if (int.tryParse(password[i]) != null &&
          int.tryParse(password[i + 1]) == int.tryParse(password[i])! + 1) {
        return true;
      }
    }
    return false;
  }
}
