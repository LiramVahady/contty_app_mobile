import 'package:contty_app/pages/on_boarding/personal_details_page/buissines_categories_moda_page/buissines_category_modal_page.dart';
import 'package:contty_app/pages/on_boarding/policy_page_modal.dart';
import 'package:contty_app/pages/on_boarding/sign_up_page/sign_up_page.dart';
import 'package:contty_app/provider/user_info_provider.dart';
import 'package:contty_app/routes/routes.dart';

import 'package:contty_app/widgets/background_page.dart';
import 'package:contty_app/widgets/dialog.dart';
import 'package:contty_app/widgets/loading_dialog.dart';
import 'package:contty_app/widgets/primary_button.dart';
import 'package:contty_app/widgets/primary_text_title.dart';
import 'package:contty_app/widgets/on_boarding_text_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:google_fonts/google_fonts.dart';

class PersonalDetailsPage extends ConsumerWidget {
  final List<String> audianceTypes = ["Both", "Woman", "Man"];

  _openBuissinesNicheModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: const Color(0xff212531),
        builder: (ctx) {
          return BuissinesNicheModaPage();
        });
  }

  String _getAudHebrew(String val) {
    switch (val) {
      case "Man":
        return "גברים";
      case "Woman":
        return "נשים";
      case "Both":
        return "שניהם";
      default:
        return "";
    }
  }

  _showPrivacyModalPage(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (ctx) => SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.8,
            child: PrivacyAndTermsModal()));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    const txt =
        "בקשתך נקלטה במערכת בהצלחה ,תוכל להתעדכן לגבי בקשתך דרך הגדרות -> הבקשות שליעד אז באפשרותך לבחור תחום עסק דומה";
    final controller = ref.read(userInfoProvider.notifier);
    final state = ref.watch(userInfoProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const Positioned.fill(child: BackgroundPageStyle()),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: OnBoardingAppBar(
                    showBackButton: false,
                    title: "פרטים אישיים",
                    showLogoImage: false,
                  ),
                ),
                const SizedBox(
                  height: 33,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    //  height: MediaQuery.sizeOf(context).height * 1,
                    width: MediaQuery.sizeOf(context).width * 1,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      border: const Border(
                        left: BorderSide(
                          width: 1.50,
                          strokeAlign: BorderSide.strokeAlignOutside,
                          color: Color(0xFF5E5F63),
                        ),
                        top: BorderSide(
                          width: 1.50,
                          strokeAlign: BorderSide.strokeAlignOutside,
                          color: Color(0xFF5E5F63),
                        ),
                        right: BorderSide(
                          width: 1.50,
                          strokeAlign: BorderSide.strokeAlignOutside,
                          color: Color(0xFF5E5F63),
                        ),
                        bottom: BorderSide(
                          strokeAlign: BorderSide.strokeAlignOutside,
                          color: Color(0xFF5E5F63),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 60,
                          ),
                          Image.asset("assets/images/logo/dots_logo.png"),
                          spacer(50),
                          /** Fields User Name:**/
                          UserInfoTextField(
                            label: "שם משתמש",
                            errorText: state.userNameError,
                            hintText: state.userName,
                            onChange: (val) => {
                              print("user name changed"),
                              controller.setUserName(val),
                              controller.setUserNameError(null)
                            },
                            endEditing: (val) => {
                              if (!val)
                                if (state.userName == null ||
                                    state.userName!.isEmpty)
                                  {controller.setUserNameError("הזן שם משתמש")}
                            },
                            rightWidget: Container(
                              width: 10,
                              height: 10,
                              padding: EdgeInsets.all(13),
                              child: Image.asset(
                                "assets/images/icons/person.png",
                              ),
                            ),
                          ),
                          // /** Fields Buissines:**/
                          spacer(40),
                          /** B Name**/
                          UserInfoTextField(
                            label: "שם העסק",
                            onChange: (val) => {
                              controller.setBusinessName(val),
                              controller.setBusinessNameError(null)
                            },
                            endEditing: (val) => {
                              if (!val)
                                if (state.businessName == null ||
                                    state.businessName!.isEmpty)
                                  {
                                    controller
                                        .setBusinessNameError("הזן שם העסק")
                                  }
                            },
                            errorText: state.businessNameError,
                            hintText: state.businessName ?? "",
                            rightWidget: Container(
                              width: 10,
                              height: 10,
                              padding: EdgeInsets.all(13),
                              child: Image.asset(
                                "assets/images/icons/bag.png",
                              ),
                            ),
                          ),
                          // /** Buissiness Type **/
                          spacer(40),
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                _openBuissinesNicheModal(context);
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.only(left: 40, right: 15),
                                width: 178,
                                height: 45,
                                decoration: ShapeDecoration(
                                  color: Color(0xFF262A34),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/icons/down_row.png",
                                      width: 14,
                                      height: 18,
                                    ),
                                    const Spacer(),
                                    PrimaryTextTitle(
                                        text: state.businessCategory == null ||
                                                state.businessCategory!.isEmpty
                                            ? "תחום בית העסק"
                                            : state.businessCategory!,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // /** target audience **/
                          spacer(30),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Column(
                              children: [
                                Text(
                                  style: GoogleFonts.ibmPlexSansHebrew(
                                      textStyle: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              Colors.white.withOpacity(0.5))),
                                  "קהל יעד",
                                ),
                              ],
                            ),
                          ),
                          spacer(20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: audianceTypes.map((item) {
                              return Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                    color: state.selectedAudiene == item
                                        ? Colors.blue
                                        : null,
                                    border: Border.all(
                                        color: Colors.white, width: 1),
                                    borderRadius: BorderRadius.circular(15)),
                                child: FittedBox(
                                  child: GestureDetector(
                                    onTap: () =>
                                        {controller.setSelectedAud(item)},
                                    child: PrimaryTextTitle(
                                        text: _getAudHebrew(item),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          /** About Buissines **/
                          spacer(40),
                          UserInfoTextField(
                            errorText: state.descriptionError,
                            label: "על מנת שנוכל לספק לך נתונים מותאים",
                            hintText: state.description ??
                                "ספר לנו בכמה מילים על העסק שלך",
                            // placeholder: "ספר לנו בכמה מילים על העסק שלך",
                            onChange: (val) => {
                              controller.setDescriptionError(""),
                              controller.setDescription(val)
                            },
                            endEditing: (val) => {
                              if (state.description == null ||
                                  state.description!.isEmpty)
                                {controller.setDescriptionError("שדה חובה")}
                            },
                          ),
                          // /** Agress Policy **/
                          spacer(70),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  print("privacy");
                                },
                                child: GestureDetector(
                                  onTap: () {
                                    _showPrivacyModalPage(context);
                                  },
                                  child: const Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'קראתי ואני מסכים ',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontFamily: 'IBM Plex Sans Hebrew',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                            letterSpacing: -0.27,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'לתנאי שימוש',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontFamily: 'IBM Plex Sans Hebrew',
                                            fontWeight: FontWeight.w700,
                                            height: 0,
                                            letterSpacing: -0.27,
                                          ),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ),
                              Checkbox(
                                value: state.agreedToTerms,
                                onChanged: (value) {
                                  controller.setAgreedToTerms(value ?? false);
                                },
                                side: const BorderSide(
                                    color: Colors.white, width: 1),
                              ),
                            ],
                          ),
                          spacer(70),
                          SizedBox(
                              height: 54,
                              width: MediaQuery.sizeOf(context).width * 0.8,
                              child: PrimaryButton(
                                  title: "כניסה לחשבון",
                                  onPress: () async {
                                    final allFieldNotEmpty =
                                        controller.validateFields();
                                    //validate fields
                                    if (!allFieldNotEmpty) return;

                                    //validate privacy termr
                                    if (!controller.isPrivacyAgree()) {
                                      DialogWidget.show("הרשמה נכשלה",
                                          "אנא הסכם לתנאי השימוש", context);
                                      return;
                                    }
                                    LoadingDialog.show(context);
                                    final result =
                                        await controller.postUserInfo();
                                    LoadingDialog.hide(context);
                                    if (result == null) return;

                                    if (result.isSuccess) {
                                      Navigator.pushNamed(context, Routes.main);
                                    } else {
                                      DialogWidget.show("הרשמה נכשלה",
                                          result.errorMessage!, context);
                                    }
                                  })),
                          spacer(70)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget spacer(double height) {
    return SizedBox(
      height: height,
    );
  }
}
