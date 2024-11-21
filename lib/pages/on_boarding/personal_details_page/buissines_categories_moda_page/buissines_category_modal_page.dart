import 'package:contty_app/models/service/categories.dart';
import 'package:contty_app/pages/on_boarding/personal_details_page/apply_new_category_form/apply_new_category_form.dart';
import 'package:contty_app/provider/buissines_categories_provider.dart';
import 'package:contty_app/provider/user_info_provider.dart';

import 'package:contty_app/widgets/or_seperator.dart';
import 'package:contty_app/widgets/search_bar.dart';
import 'package:contty_app/widgets/unicorn_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class BuissinesNicheModaPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, ref, child) {
        final categories = ref.watch(categoriesStateProvider);

        return Container(
          height: MediaQuery.sizeOf(context).height * 0.72,
          child: Column(
            children: [
              spacer(15),
              /** Top Line **/
              Container(
                width: 75,
                height: 8,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0xff616676)),
              ),
              /** Search Bar **/
              spacer(26),
              PrimarySearchBar(),
              /** Apply New Buissines Form **/
              spacer(26),
              UnicornOutlineBorder(
                  backgroundColor: const Color(0x33246BFD),
                  strokeWidth: 2,
                  radius: 15,
                  gradient: const LinearGradient(colors: [
                    Color(0xff00A973),
                    Color(0xffE9B875),
                    Color(0xffFF00B0)
                  ]),
                  child: const Text("הגשת בקשה להוספת תחום עסק"),
                  onPressed: () {
                    Navigator.pop(context);
                    showModalBottomSheet(
                        context: context,
                        backgroundColor: Color(0xff212531),
                        builder: (ctx) => ApplyNewCategoryForm());
                  }),
              /** Or Seperator **/
              spacer(26),
              OrSeperator(),
              spacer(26),
              Text(
                  'במידה ותחום העסק שלך לא נמצא\nיש לבחור תחום דומה לקבלת תוצאות דומות',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ibmPlexSansHebrew(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: 'IBM Plex Sans Hebrew',
                      fontWeight: FontWeight.w700,
                      // height: 1.2,
                    ),
                  )),
              Expanded(
                  child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    alignment: WrapAlignment.center,
                    children: categories
                        .map((item) => _buildGridItem(item, context, ref))
                        .toList(),
                  ),
                ),
              ))
            ],
          ),
        );
      },
    );
  }

  SizedBox spacer(double height) {
    return SizedBox(
      height: height,
    );
  }

  Widget _buildGridItem(
      BuissinesCategory item, BuildContext context, WidgetRef ref) {
    final userInfoController = ref.read(userInfoProvider.notifier);
    final state = ref.watch(userInfoProvider);
    return IntrinsicWidth(
      child: OutlinedButton(
        onPressed: () {
          userInfoController.setBusinessCategory(item.name);
          Navigator.pop(context);
        },
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.white, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          backgroundColor: state.businessCategory == item.name
              ? Colors.purple
              : Colors.transparent,
        ),
        child: Text(
          item.name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
