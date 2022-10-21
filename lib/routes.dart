import 'package:caregigsworkabroad/screens/HomePage/HomeView/HomeWidgets/FeedView/comments.dart';
import 'package:caregigsworkabroad/screens/HomePage/HomeView/HomeWidgets/FeedView/replies.dart';
import 'package:caregigsworkabroad/screens/HomePage/HomeView/HomeWidgets/create_post_view/create_post_page.dart';
import 'package:caregigsworkabroad/screens/HomePage/HomeView/chat_view/user_chat_screen.dart';
import 'package:caregigsworkabroad/screens/HomePage/nav_bar.dart';
import 'package:caregigsworkabroad/screens/_screen_bindindgs/comments_view_bindings.dart';
import 'package:caregigsworkabroad/screens/_screen_bindindgs/create_post_bindings.dart';
import 'package:caregigsworkabroad/screens/_screen_bindindgs/home_screen_bindings.dart';
import 'package:caregigsworkabroad/screens/_screen_bindindgs/login_screen_bindings.dart';
import 'package:caregigsworkabroad/screens/_screen_bindindgs/nav_bar_binding.dart';
import 'package:caregigsworkabroad/screens/_screen_bindindgs/reply_view_bindings.dart';
import 'package:caregigsworkabroad/screens/_screen_bindindgs/signup_screen_bindings.dart';
import 'package:caregigsworkabroad/screens/HomePage/HomeView/home_screen.dart';
import 'package:caregigsworkabroad/screens/_screen_bindindgs/user_chat_bindings.dart';
import 'package:caregigsworkabroad/screens/login_screen.dart';
import 'package:caregigsworkabroad/screens/signupflow/email_verification.dart';
import 'package:caregigsworkabroad/screens/signupflow/signup_screen.dart';
import 'package:get/get.dart';

class Routes {
  static const String login = '/login';
  static const String signup = '/signup';
  static const String emailVerification = '/EmailVerification';
  static const String homePageNav = '/HomePage';
  static const String homeScreen = '/HomeScreen';
  static const String createPost = '/CreatePost';
  static const String comments = '/comments';
  static const String replies = '/replies';
  static const String userchat = '/userchat';
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
        name: Routes.homePageNav,
        page: () => const HomeNavBar(),
        binding: NavBarBinding()),
    GetPage(
        name: Routes.homeScreen,
        page: () => const HomeScreen(),
        binding: HomeScreenBindings()),
    GetPage(
        name: Routes.createPost,
        page: () => const CreatePostPage(),
        binding: CreatePostbindings()),
    GetPage(
        name: Routes.comments,
        page: () => const CommentsPage(),
        binding: CommentsViewBindings()),
    GetPage(
        name: Routes.replies,
        page: () => const RepliesPage(),
        binding: ReplyViewBindings()),
    GetPage(
        name: Routes.userchat,
        page: () => const UserChat(),
        binding: UserChatBindings()),
  ];
}
