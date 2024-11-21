import 'package:contty_app/controllers/on_boarding/registe_controller.dart';
import 'package:contty_app/models/ui/register_fields_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authenticationProvider =
    StateNotifierProvider.autoDispose<AuthenticationController, RegisterState>(
  (ref) => AuthenticationController(),
);
