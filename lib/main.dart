import 'package:contty_app/controllers/auth_controller.dart';
import 'package:contty_app/globals/contants_values.dart';
import 'package:contty_app/pages/archeive_page/archeive_page.dart';
import 'package:contty_app/pages/create_post_process/create_post_image/create_image_post.dart';
import 'package:contty_app/pages/create_post_process/create_post_image/post_image_preview_page.dart';
import 'package:contty_app/pages/home_page/home_page.dart';
import 'package:contty_app/pages/main_page.dart';
import 'package:contty_app/pages/on_boarding/forgot_password_page/forgot_password_page.dart';
import 'package:contty_app/pages/on_boarding/login_page/login_page.dart';
import 'package:contty_app/pages/on_boarding/personal_details_page/personal_details_page.dart';
import 'package:contty_app/pages/on_boarding/sign_up_page/sign_up_page.dart';
import 'package:contty_app/pages/setting/plan/premium_plan_wiget.dart';
import 'package:contty_app/pages/setting/privacy_setting_page.dart';
import 'package:contty_app/pages/splash_page/splash_page.dart';
import 'package:contty_app/routes/routes.dart';
import 'package:contty_app/service/http_service.dart';
import 'package:contty_app/widgets/background_page.dart';
import 'package:contty_app/widgets/blur_modal_widger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _setupServices();
  runApp(ProviderScope(child: MyApp()));
}

Future<void> _setupServices() async {
  GetIt.instance.registerSingleton(HttpService());
}

class MyApp extends ConsumerWidget {
  final theme = ThemeData();

  // Define routes outside the builder for better structure
  static final routes = {
    Routes.archeive: (context) => ArcheivePage(),
    Routes.signUp: (context) => SignUpPage(),
    Routes.forgotPassword: (context) => ForgotPasswordPage(),
    Routes.personalDetails: (context) => PersonalDetailsPage(),
    Routes.main: (context) => MainPage(),
    Routes.ctreateImagePost: (context) => CreateImagePost(),
    Routes.postImagePreview: (context) => PostImagePreviewPage(),
    Routes.privacySetting: (context) => PrivacySettingPage(),
    Routes.planPremium: (context) => PremiumPlanWiget(),
    Routes.login: (context) => LoginPage(), // Don't forget your login route
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget page = SplashScreen();
    final staet = ref.watch(authProvider);
    switch (staet) {
      case Routes.main:
        page = MainPage();
      case Routes.login:
        page = LoginPage();
      default:
        SplashScreen();
    }
    ;
    return MaterialApp(
        theme: theme.copyWith(
          scaffoldBackgroundColor: ConstantColor.PRIMARY_BG_COLOR,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Color(0xFF246BFD), // For buttons or primary color
            onPrimary: Colors.white, // Text color on buttons
            surface: Color(0xFF191B23), // Card and Drawer background
          ),
          primaryColor: Color(0xFF246BFD), // Button color
          textTheme: TextTheme(
              bodyLarge: GoogleFonts.ibmPlexSansHebrew(
                  textStyle: TextStyle(color: Colors.white))),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF246BFD),
            foregroundColor: Colors.white, // Button text color
          )),
        ),
        routes: {
          Routes.home: (context) => HomePage(),
          Routes.splash: (context) => SplashScreen(),
          Routes.archeive: (context) => ArcheivePage(),
          Routes.signUp: (context) => SignUpPage(),
          Routes.forgotPassword: (context) => ForgotPasswordPage(),
          Routes.personalDetails: (context) => PersonalDetailsPage(),
          Routes.main: (context) => MainPage(),
          Routes.ctreateImagePost: (context) => CreateImagePost(),
          Routes.postImagePreview: (context) => PostImagePreviewPage(),
          Routes.privacySetting: (context) => PrivacySettingPage(),
          Routes.planPremium: (context) => PremiumPlanWiget(),
          Routes.login: (context) => LoginPage(), // Don'
        },
        // Use `initialRoute` directly with the `authState`
        home: page);
  }
}

class SplashScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return Stack(
      children: [
        Positioned.fill(child: BackgroundPageStyle()),
        BlurModalWidger(
          child: Center(
            child: Image.asset("assets/images/logo/logo.png"),
          ),
        )
      ],
    );
  }
}
