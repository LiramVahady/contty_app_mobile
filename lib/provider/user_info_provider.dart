import 'package:contty_app/controllers/auth_controller.dart';
import 'package:contty_app/controllers/user/user_info_controller.dart';
import 'package:contty_app/models/state_model/user_info_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userInfoProvider =
    StateNotifierProvider<UserInfoController, UserInfoState>(
  (ref) {
    return UserInfoController();
  },
);
