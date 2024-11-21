import 'package:contty_app/globals/contants_values.dart';
import 'package:contty_app/models/service/user.dart';
import 'package:contty_app/models/state_model/user_info_state.dart';
import 'package:contty_app/service/http_response.dart';
import 'package:contty_app/service/http_service.dart';
import 'package:contty_app/singelton/shared_user.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

class UserInfoController extends StateNotifier<UserInfoState> {
  final GetIt _getIt = GetIt.instance;
  late HttpService _httpService;
  UserInfoController() : super(UserInfoState()) {
    _httpService = _getIt.get<HttpService>();
  }

  //-Sets
  void setUserName(String? userName) {
    state = state.copyWith(userName: userName);
  }

  void setUserNameError(String? error) {
    state = state.copyWith(userNameError: error);
  }

  void setBusinessName(String value) {
    state = state.copyWith(businessName: value);
  }

  void setBusinessNameError(String? value) {
    state = state.copyWith(businessNameError: value);
  }

  void setTargetAudience(Map<String, dynamic> value) {
    state = state.copyWith(targetAudience: value);
  }

  void setSelectedAud(String val) {
    state = state.copyWith(selectedAudiene: val);
  }

  void setTargetAudienceError(String? value) {
    state = state.copyWith(targetAudienceError: value);
  }

  void setAgreedToTerms(bool value) {
    state = state.copyWith(agreedToTerms: value);
  }

  void setAgreedToTermsError(String? value) {
    state = state.copyWith(agreedToTermsError: value);
  }

  void setBusinessCategory(String value) {
    state = state.copyWith(businessCategory: value);
  }

  void setBusinessCategoryError(String? value) {
    state = state.copyWith(businessCategoryError: value);
  }

  void setDescription(String value) {
    state = state.copyWith(description: value);
  }

  void setDescriptionError(String? value) {
    state = state.copyWith(descriptionError: value);
  }

  bool validateFields() {
    if (state.userName == null || state.userName!.isEmpty) {
      setUserNameError("הזן שם משתמש");
      return false;
    } else if (state.businessName == null || state.businessName!.isEmpty) {
      setBusinessNameError("הזן שם עסק");
      return false;
    } else if (state.description == null || state.description!.isEmpty) {
      setDescriptionError("שדה חובה");
      return false;
    }

    return true;
  }

  bool isPrivacyAgree() {
    return state.agreedToTerms ?? false;
  }

  String dialogErrorMessae() {
    return "";
  }

  Future<HttpResult?> postUserInfo() async {
    print(SharedUser.instance.currentUser!.id!);
    try {
      final userInfo = UserInfo(
          fullName: state.userName!,
          businessName: state.businessName!,
          targetAudience: state.selectedAudiene!,
          agreedToTerms: state.agreedToTerms!,
          businessCategory: state.businessCategory!,
          description: state.description!,
          userId: SharedUser.instance.currentUser!.id);
      final body = userInfo.toJson();

      final response = await _httpService.post(HTTPEntPoint.userInfo, body);
      if (response?.data != null && response!.statusCode == 201) {
        SharedUser.instance.setUsetInfo(UserInfo.fromJson(response.data));
        return HttpResult(
            errorMessage: null, data: response.data, isSuccess: true);
      }
    } catch (e) {
      print(e);
      return HttpResult(errorMessage: e.toString(), data: {}, isSuccess: false);
    }
  }
}
