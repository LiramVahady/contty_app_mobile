import 'package:contty_app/models/ui/privacy_setting.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PrivacySettingController extends StateNotifier<List<PrivacySettingData>> {
  PrivacySettingController()
      : super([
          PrivacySettingData("התראות על תזכורות ליצירת פוסטים", false),
          PrivacySettingData(
              "התראות על חידוש מכסת סיבובים ליצירת רעיונות", false),
          PrivacySettingData("התראות על סטטוס בקשות", false)
        ]);

  //Toggle
  void toggleSetting(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index)
          // Ensure all properties are copied correctly
          PrivacySettingData(state[i].title, !state[i].isOn)
        else
          state[i],
    ];
  }
}
