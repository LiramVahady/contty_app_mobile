import 'package:contty_app/globals/contants_values.dart';
import 'package:contty_app/pages/on_boarding/personal_details_page/personal_details_page.dart';
import 'package:contty_app/service/http_service.dart';
import 'package:contty_app/widgets/primary_text_title.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final policyContentProvider =
    StateNotifierProvider<PolicyContentNotifier, String>(
  (ref) => PolicyContentNotifier(),
);

//Notifier
class PolicyContentNotifier extends StateNotifier<String> {
  final GetIt _getIt = GetIt.instance;
  late HttpService _httpService;
  PolicyContentNotifier() : super('') {
    _httpService = _getIt.get<HttpService>();
    _loadPolicyContent();
  }

  // Function to load policy content
  Future<void> _loadPolicyContent() async {
    try {
      final Response? res = await _httpService.get(HTTPEntPoint.userAgreement);
      if (res?.data != null && res!.statusCode == 200) {
        print("Privacy data ${res.data}");
        state = res.data;
      }
    } catch (e) {
      // Handle errors and update the state
      state = "Failed to load policy content. Please try again.";
    }
  }
}

class PrivacyAndTermsModal extends ConsumerWidget {
  Future<void> _loadPolicy() async {}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final staet = ref.watch(policyContentProvider);
        return Container(
            padding: EdgeInsets.all(20),
            child: PrimaryTextTitle(
              text: staet,
              fontSize: 13,
              fontWeight: FontWeight.w400,
              textColor: Colors.black,
            )); // Replace with your actual widget
      },
    );
  }
}
