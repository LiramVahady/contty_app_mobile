import 'package:contty_app/globals/contants_values.dart';
import 'package:contty_app/main.dart';
import 'package:contty_app/pages/setting/setting_page.dart';
import 'package:contty_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainHeaderWidget extends StatelessWidget {
  final String titleText;
  const MainHeaderWidget({super.key, required this.titleText});

  _showSettingPage(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: ConstantColor.PRIMARY_BG_COLOR,
      isScrollControlled: true,
      // isScrollControlled: true,
      builder: (ctx) {
        return SettingPage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            _showSettingPage(context);
          },
          child: Image.asset(
            "assets/images/icons/burger.png",
            width: 50,
            height: 50,
            fit: BoxFit.contain,
          ),
        ),
        const Spacer(),
        Text(
          titleText,
          textAlign: TextAlign.end,
          style: GoogleFonts.ibmPlexSansHebrew(
              textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w700)),
        ),
      ],
    );
  }
}
