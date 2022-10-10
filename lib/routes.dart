import 'package:caregigsworkabroad/screens/_screen_bindindgs/home_screen_bindings.dart';
import 'package:caregigsworkabroad/screens/_screen_bindindgs/login_screen_bindings.dart';
import 'package:caregigsworkabroad/screens/_screen_bindindgs/signup_screen_bindings.dart';
import 'package:caregigsworkabroad/screens/home_screen.dart';
import 'package:caregigsworkabroad/screens/login_screen.dart';
import 'package:caregigsworkabroad/screens/signup_screen.dart';
import 'package:get/get.dart';

class Routes {
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
}

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.home,
        page: () => const HomeScreen(),
        binding: HomeScreenBindings()),
    GetPage(
        name: Routes.login,
        page: () => const LoginScreen(),
        binding: LoginScreenBindings()),
    GetPage(
        name: Routes.signup,
        page: () => const SignUpScreen(),
        binding: SignupScreenBindings()),
  ];
}
