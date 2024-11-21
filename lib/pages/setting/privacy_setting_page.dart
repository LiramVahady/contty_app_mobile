import 'package:contty_app/models/ui/privacy_setting.dart';
import 'package:contty_app/pages/create_post_process/create_post_image/header_post_image.dart';
import 'package:contty_app/pages/main_page.dart';
import 'package:contty_app/provider/privacy_setting_provider.dart';
import 'package:contty_app/widgets/background_page.dart';
import 'package:contty_app/widgets/primary_button.dart';
import 'package:contty_app/widgets/primary_text_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PrivacySettingPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final setting = ref.watch(privacySettingProvider);
    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(child: BackgroundPageStyle()),
          const Positioned(
            child: DiviedHeaderWidget(
              showBottomDivider: true,
              title: "פרטיות",
            ),
          ),
          Positioned(
            top: MediaQuery.sizeOf(context).height * 0.16,
            right: 25,
            left: 25,
            bottom: 0, //MediaQuery.sizeOf(context).height * 0.1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _spacer(10),
                PrimaryTextTitle(
                  text: "הגדרת התראות",
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
                _spacer(20),
                PrimaryTextTitle(
                  text: "שלחו התראות במקרים הבאים",
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
                _spacer(10),
                Container(
                  height: 1,
                  width: MediaQuery.sizeOf(context).width,
                  color: const Color(0xffEFF4F8),
                ),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 5,
                      );
                    },
                    itemBuilder: (ctx, index) {
                      final title = setting[index].title;
                      final isOn = setting[index].isOn;
                      return Column(
                        children: [
                          ListTile(
                            contentPadding: const EdgeInsets.all(1),
                            leading: Switch(
                                value: isOn,
                                onChanged: (val) {
                                  ref
                                      .watch(privacySettingProvider.notifier)
                                      .toggleSetting(index);
                                }),
                            trailing: PrimaryTextTitle(
                                text: title,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          Container(
                            height: 1,
                            color: Colors.white,
                          )
                        ],
                      );
                    },
                    itemCount: setting.length,
                  ),
                ),
                PrimaryTextTitle(
                    text: "מחיקת החשבון",
                    fontSize: 17,
                    fontWeight: FontWeight.w700),
                _spacer(20),
                Container(
                  height: 1,
                  color: Colors.white,
                  padding: const EdgeInsets.only(bottom: 15),
                ),
                _spacer(20),
                Row(
                  children: [
                    SizedBox(
                        height: 35,
                        child: PrimaryButton(title: "מחק ", onPress: () {})),
                    const Spacer(),
                    PrimaryTextTitle(
                        text:
                            "לאחר מחיקת החשבון כלל הנתונים \n השייכים לחשבון יימחקו לצמיתות",
                        fontSize: 14,
                        fontWeight: FontWeight.w500)
                  ],
                ),
                _spacer(15),
                Container(
                  height: 1,
                  color: Colors.white,
                  margin: EdgeInsets.only(top: 15),
                ),
                _spacer(MediaQuery.sizeOf(context).height * 0.31)
              ],
            ),
          ),
        ],
      ),
    );
  }

  _spacer(double h) {
    return SizedBox(
      height: h,
    );
  }
}
