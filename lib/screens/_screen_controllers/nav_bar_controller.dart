import 'package:caregigsworkabroad/screens/HomePage/jobs_screen.dart';
import 'package:caregigsworkabroad/screens/HomePage/study_screen.dart';

import '../../utils/common_imports.dart';
import '../HomePage/groups_screen.dart';
import '../HomePage/home_screen.dart';

class NavBarController extends GetxService {
  RxBool hideNavBar = false.obs;
  static NavBarController get to => Get.find<NavBarController>();
  RxInt currentIndex = 0.obs;
  final List<Widget> children = [
    const HomeScreen(),
    const GroupsScreen(),
    const StudyScreen(),
    const JobsScreen(),
  ];

  onTabTapped(int index) {
    currentIndex(index);
  }
}