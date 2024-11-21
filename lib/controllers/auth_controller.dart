import 'package:contty_app/globals/contants_values.dart';
import 'package:contty_app/models/service/user.dart';
import 'package:contty_app/models/state_model/user_info_state.dart';
import 'package:contty_app/routes/routes.dart';
import 'package:contty_app/service/error_handler.dart';
import 'package:contty_app/service/http_response.dart';
import 'package:contty_app/service/http_service.dart';
import 'package:contty_app/singelton/shared_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends StateNotifier<String> {
  final GetIt _getIt = GetIt.instance;
  late HttpService _httpService;
  AuthController() : super(Routes.splash) {
    _httpService = _getIt.get<HttpService>();
    _initialRoute();
  }

  Future<void> _initialRoute() async {
    final _shared = await SharedPreferences.getInstance();
    final token = _shared.getString("token");
    if (token != null && token.isNotEmpty) {
      //load user data
      final isUserLoadSucces = await loadUserData();

      state = isUserLoadSucces ? Routes.main : Routes.login; //Chnage to login
    } else {
      state = Routes.login;
    }
  }

//Hnadle in current user and user info
  Future<bool> loadUserData() async {
    final cUserResponse = await _loadCurrentUser();
    if (cUserResponse != null && cUserResponse.isSuccess) {
      final id = cUserResponse.data["id"];
      final userInfo = await loadUserInfo(id);
      if (userInfo?.data == null) {
        return false;
      } else {
        return true;
      }
    }

    return false;
  }

  Future<HttpResult?> _loadCurrentUser() async {
    try {
      final response = await _httpService.get(HTTPEntPoint.currentUser);
      if (response != null && response.data != null) {
        final user = response.data;
        SharedUser.instance.updateUser(user);
        return HttpResult(errorMessage: null, data: user, isSuccess: true);
      }
    } catch (e) {
      if (e is CustomException) {
        return HttpResult(
            errorMessage: e.toString(), data: {}, isSuccess: false);
      } else {
        return HttpResult(errorMessage: "", data: {}, isSuccess: false);
      }
    }
  }

  Future<HttpResult?> loadUserInfo(String id) async {
    try {
      final correntUserInfoPath =
          HTTPEntPoint.userInfoById.replaceAll("{id}", id);
      final response = await _httpService.get(correntUserInfoPath);
      if (response?.data != null && response!.statusCode == 200) {
        final List<UserInfo> info = (response.data as List<dynamic>)
            .map((user) => UserInfo.fromJson(user as Map<String, dynamic>))
            .toList();
        if (info.isNotEmpty) {
          SharedUser.instance.setUsetInfo(info.first);
          return HttpResult(
              errorMessage: null, data: info.first, isSuccess: true);
        }
        return HttpResult(errorMessage: null, data: null, isSuccess: false);
      }
    } catch (e) {
      return HttpResult(errorMessage: e.toString(), data: {}, isSuccess: false);
    }
  }
}

final authProvider =
    StateNotifierProvider.autoDispose<AuthController, String>((ref) {
  return AuthController();
});
