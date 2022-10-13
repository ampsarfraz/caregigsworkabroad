import 'package:caregigsworkabroad/screens/HomePage/nav_bar.dart';
import 'package:caregigsworkabroad/screens/_screen_bindindgs/home_screen_bindings.dart';
import 'package:caregigsworkabroad/screens/_screen_bindindgs/login_screen_bindings.dart';
import 'package:caregigsworkabroad/screens/_screen_bindindgs/nav_bar_binding.dart';
import 'package:caregigsworkabroad/screens/_screen_bindindgs/signup_screen_bindings.dart';
import 'package:caregigsworkabroad/screens/HomePage/HomeView/home_screen.dart';
import 'package:caregigsworkabroad/screens/login_screen.dart';
import 'package:caregigsworkabroad/screens/signupflow/email_verification.dart';
import 'package:caregigsworkabroad/screens/signupflow/signup_screen.dart';
import 'package:get/get.dart';

class Routes {
  static const String login = '/login';
  static const String signup = '/signup';
  static const String emailVerification = '/EmailVerification';
  static const String homePage = '/HomePage';
  static const String homeScreen = '/HomeScreen';
}

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.login,
        page: () => const LoginScreen(),
        binding: LoginScreenBindings()),
    GetPage(
        name: Routes.signup,
        page: () => const SignUpScreen(),
        binding: SignupScreenBindings()),
    GetPage(
      name: Routes.emailVerification,
      page: () => const EmailVerification(),
    ),
    GetPage(
        name: Routes.homePage,
        page: () => const HomeNavBar(),
        binding: NavBarBinding()),
    GetPage(
        name: Routes.homeScreen,
        page: () => const HomeScreen(),
        binding: HomeScreenBindings()),
  ];
}
