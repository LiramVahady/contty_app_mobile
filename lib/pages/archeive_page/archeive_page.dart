import 'package:contty_app/widgets/blur_modal_widger.dart';
import 'package:contty_app/widgets/main_pages_header.dart';
import 'package:contty_app/widgets/primary_text_title.dart';
import 'package:contty_app/utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ArcheivePage extends ConsumerWidget {
  _showDatePickerModal(BuildContext context, WidgetRef ref) async {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white.withOpacity(0),
        isScrollControlled: true,
        builder: (context) {
          return BlurModalWidger(
            child: Positioned(
              left: MediaQuery.of(context).size.width * 0.1,
              right: MediaQuery.of(context).size.width * 0.1,
              top: MediaQuery.of(context).size.height * 0.18,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "בחרו טווח תאריכים",
                      style: GoogleFonts.ibmPlexSansHebrew(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w700)),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      height: MediaQuery.sizeOf(context).height * 0.5,
                      child: DatePickerDialog(
                          firstDate: DateTime.now(), lastDate: DateTime.now()),
                    ),
                    /** Bottom Controller **/
                    const SizedBox(
                      height: 110,
                    ),
                    BottomController(controllerRow: [
                      BottomControllerRow(
                        title: "חזור",
                        icon: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Image.asset(
                                "assets/images/icons/back_row.png")),
                      )
                    ])
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return Scaffold(
      //appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /** Header **/
            const MainHeaderWidget(titleText: "ארכיון פוסטים"),
            /** Tool Filter/Search  **/
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                const Spacer(),
                /** Filter By Dates **/
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        _showDatePickerModal(context, ref);
                      },
                      child: Text(
                        "חיפוש לפי תאריך",
                        style: GoogleFonts.ibmPlexSansHebrew(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400)),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Image.asset(
                      "assets/images/icons/search_02.png",
                      width: 14,
                      height: 14,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 25,
                ),
                /** All Posts **/
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        color: const Color(0xFF246BFD),
                        borderRadius: BorderRadius.circular(25)),
                    child: FittedBox(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          PrimaryTextTitle(
                              text: "כל הפוסטים",
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                          SizedBox(
                            width: 5,
                          ),
                          Image.asset(
                            "assets/images/icons/categories.png",
                            width: 15,
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  color: Colors.white.withOpacity(0.4),
                  "assets/images/icons/down_row.png",
                  width: 15,
                  height: 15,
                ),
                SizedBox(
                  width: 5,
                ),
                PrimaryTextTitle(
                    textColor: Colors.white.withOpacity(0.4),
                    text: MyDateUtils.formatDateTime(DateTime.now()),
                    fontSize: 12,
                    fontWeight: FontWeight.w500)
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            _buildHorizontalList(context),
            const SizedBox(
              height: 20,
            ),
            // _buildHorizontalList(),
          ],
        ),
      ),
    );
  }

  Widget _buildHorizontalList(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.25,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10, // Number of cards in the list
        separatorBuilder: (context, index) =>
            SizedBox(width: 35), // Spacing between cards
        itemBuilder: (context, index) {
          return const ArchivePostCard();
        },
      ),
    );
  }
}

class ArchivePostCard extends StatelessWidget {
  const ArchivePostCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF262A34),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.6,
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/mock/post1.png",
            ),
            SizedBox(height: 10),
            Text(
              "כיצד להשיג עוד זוהר ב-5 צעדים",
              style: GoogleFonts.ibmPlexSansHebrew(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w500)),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomController extends ConsumerWidget {
  final List<Widget> controllerRow;
  BottomController({super.key, required this.controllerRow});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: controllerRow);
  }
}

// ignore: must_be_immutable
class BottomControllerRow extends StatelessWidget {
  Widget icon;
  String title;
  BottomControllerRow({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            title,
            style: GoogleFonts.ibmPlexSansHebrew(
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
          ),
          const SizedBox(
            width: 30,
          ),
          Container(
            width: 60,
            height: 60,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2), shape: BoxShape.circle),
            child: Center(
              child: icon,
            ),
          ),
        ],
      ),
    );
  }
}
