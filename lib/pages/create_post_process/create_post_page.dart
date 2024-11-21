import 'package:contty_app/pages/archeive_page/archeive_page.dart';
import 'package:contty_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatePostWizardPage extends ConsumerWidget {
  CreatePostWizardPage({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(0),
      body: Center(
        child: BlurOberlayMenuWidget(
          centerTitle: "איך תרצו שהפוסט לכם יראה",
          centerLogo: Image.asset("assets/images/logo/logo.png"),
          items: [
            GestureDetector(
              onTap: () {},
              child: BottomControllerRow(
                icon: Image.asset(
                  "assets/images/icons/video.png",
                  fit: BoxFit.cover,
                ),
                title: "יצירת וידאו",
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);

                Navigator.pushNamed(context, Routes.ctreateImagePost);
              },
              child: BottomControllerRow(
                icon: Image.asset(
                  "assets/images/icons/painter.png",
                  fit: BoxFit.cover,
                ),
                title: "יצירת תמונה",
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            BottomControllerRow(
              title: "חזור",
              icon: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset("assets/images/icons/back_row.png")),
            )
          ],
        ),
      ),
    );
  }
}

class BlurOberlayMenuWidget extends StatelessWidget {
  final String centerTitle;
  final bool showLogo;
  final List<Widget> items;
  final Widget? centerLogo;

  const BlurOberlayMenuWidget(
      {super.key,
      required this.centerTitle,
      this.showLogo = false,
      this.centerLogo,
      required this.items});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            textAlign: TextAlign.center,
            centerTitle,
            style: GoogleFonts.ibmPlexSansHebrew(
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w700)),
          ),
          const SizedBox(
            height: 50,
          ),
          if (centerLogo != null) centerLogo!,
          const SizedBox(
            height: 120,
          ),
          BottomController(controllerRow: items)
        ],
      ),
    );
  }
}
