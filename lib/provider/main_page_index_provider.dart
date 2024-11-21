import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPageIndexProvider extends StateNotifier<int> {
  MainPageIndexProvider() : super(1);

  void setHomePage() => state = 1;
  void setArcheivePage() => state = 0;
}

// Create a provider to access the MainPageIndexProvider
final mainPageIndexProvider = StateNotifierProvider<MainPageIndexProvider, int>(
  (ref) => MainPageIndexProvider(),
);
