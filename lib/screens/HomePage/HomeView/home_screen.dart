import 'package:caregigsworkabroad/screens/HomePage/HomeView/HomeWidgets/complete_profile.dart';
import 'package:caregigsworkabroad/screens/HomePage/HomeView/HomeWidgets/extended_image.dart';
import 'package:caregigsworkabroad/screens/HomePage/HomeView/HomeWidgets/top_container.dart';
import 'package:caregigsworkabroad/screens/_screen_controllers/nav_bar_controller.dart';
import 'package:caregigsworkabroad/utils/common_imports.dart';
import 'package:caregigsworkabroad/screens/_screen_controllers/home_screen_controller.dart';

import 'HomeWidgets/create_post.dart';
import 'HomeWidgets/feed.dart';

class HomeScreen extends GetWidget<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        NavBarController.to.hideNavBar(false);
        controller.showImage(false);
        return false;
      },
      child: Scaffold(
        backgroundColor: AppTheme.primaryColor,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const TopContainer(),
                  Expanded(
                    child: customContainer(
                      giveHeight: null,
                      giveWidth: double.infinity,
                      top: true,
                      topLeft: 12,
                      topRight: 12,
                      bottom: false,
                      giveColor: Colors.grey.shade50,
                      containerChild: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 100.sp),
                            child: Column(
                              children: const [
                                CompleteProfileWidget(),
                                FeedContainer()
                              ],
                            ),
                          ),
                          createPostCard(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const ExtendedImage()
            ],
          ),
        ),
      ),
    );
  }
}
