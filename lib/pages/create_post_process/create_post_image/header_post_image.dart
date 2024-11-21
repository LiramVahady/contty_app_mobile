import 'package:contty_app/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DiviedHeaderWidget extends StatelessWidget {
  final String? title;
  final bool showBottomDivider;
  const DiviedHeaderWidget(
      {super.key, this.title, required this.showBottomDivider});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(
        height: 40,
      ),
      AppBar(
        backgroundColor: Colors.white.withOpacity(0),
        centerTitle: true,
        leading: BackButtonWidget(
          margin: EdgeInsets.only(left: 20),
        ),
        title: Text(
          title ?? "",
          style: GoogleFonts.ibmPlexSansHebrew(
              textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700)),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      if (showBottomDivider)
        const Divider(
          thickness: 0.2,
        )
    ]);
  }
}
