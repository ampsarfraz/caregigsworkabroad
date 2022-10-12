import 'package:caregigsworkabroad/screens/_screen_controllers/nav_bar_controller.dart';

import '../../utils/common_imports.dart';

class HomeNavBar extends GetWidget<NavBarController> {
  const HomeNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return annotedRegionLightIcon(
      Obx(
        (() => Scaffold(
            backgroundColor: Colors.white,
            body: controller.children[controller.currentIndex.value],
            bottomNavigationBar: Visibility(
              visible: !controller.hideNavBar.value,
              child: BottomNavigationBar(
                  backgroundColor: Colors.white,
                  type: BottomNavigationBarType.fixed,
                  showUnselectedLabels: true,
                  unselectedItemColor: AppTheme.commonTextColor,
                  selectedItemColor: AppTheme.primaryColor,
                  unselectedFontSize: 12,
                  selectedFontSize: 12,
                  selectedIconTheme: null,
                  iconSize: 25,
                  onTap: controller.onTabTapped,
                  currentIndex: controller.currentIndex.value,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.featured_video_outlined,
                      ),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_cart_outlined),
                      label: "Groups",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home_outlined,
                      ),
                      label: "Jobs",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.person_outline,
                      ),
                      label: "More",
                    ),
                  ]),
            ))),
      ),
    );
  }
}
