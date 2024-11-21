import 'package:contty_app/models/ui/setting_menu.dart';
import 'package:contty_app/pages/setting/contty_plan_widget.dart';
import 'package:contty_app/routes/routes.dart';
import 'package:contty_app/widgets/dismiss_button_widget.dart';
import 'package:contty_app/widgets/primary_text_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends ConsumerWidget {
  final isMemberPlan = true;
  final List<SettingMenuData> settimtListData = [
    SettingMenuData(title: "profile"),
    SettingMenuData(title: "privacy"),
    SettingMenuData(title: "rate"),
    SettingMenuData(title: "terms"),
    SettingMenuData(title: "contact"),
    SettingMenuData(title: "Logout")
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.94,
      width: MediaQuery.sizeOf(context).width,
      child: Padding(
        padding: const EdgeInsets.all(21),
        /**  Body **/
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            /**  Dismiss **/
            DismissButtonWidget(),
            _space(20),
            /**  Head Title **/
            PrimaryTextTitle(
                text: "הגדרות", fontSize: 35, fontWeight: FontWeight.w700),
            _space(10),
            /**  Status Member Container **/
            ConttyPlanStatusWidget(),
            Expanded(
                child: ListView.separated(
                    itemBuilder: (ctx, index) {
                      final title = settimtListData[index].hebrewTitle;
                      final imagePath = settimtListData[index].imagePath;
                      final route = settimtListData[index].routeName;
                      return ListTile(
                        onTap: () async {
                          if (route.toLowerCase() == "logout") {
                            final shared =
                                await SharedPreferences.getInstance();
                            shared.setString("token", "");
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              Routes
                                  .login, // Replace '/login' with your Login route name
                              (route) => false, // Remove all previous routes
                            );
                          } else {
                            // Navigator.pushNamed(context, route);
                          }
                        },
                        title: PrimaryTextTitle(
                            text: title,
                            fontSize: 19,
                            textAlign: TextAlign.end,
                            fontWeight: FontWeight.w500),
                        trailing: imagePath.isEmpty
                            ? null
                            : Image.asset(
                                imagePath,
                                width: 25,
                                height: 25,
                              ),
                      );
                    },
                    separatorBuilder: (ctx, index) {
                      return const Divider(
                        thickness: 0.2,
                        color: Colors.white,
                      );
                    },
                    itemCount: settimtListData.length)),
            _space(30),
            /**  Footer **/
            Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PrimaryTextTitle(
                      textColor: Color(0xff7B7B80),
                      textAlign: TextAlign.center,
                      text: "© 2024 Powered By Dogma",
                      fontSize: 12,
                      fontWeight: FontWeight.w400)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _space(double height) {
    return SizedBox(
      height: height,
    );
  }
}
