import 'package:contty_app/controllers/setting/setting_privacy_controller.dart';
import 'package:contty_app/models/ui/privacy_setting.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final privacySettingProvider =
    StateNotifierProvider<PrivacySettingController, List<PrivacySettingData>>(
  (ref) => PrivacySettingController(),
);
