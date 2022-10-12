import 'package:caregigsworkabroad/screens/_screen_controllers/nav_bar_controller.dart';
import 'package:caregigsworkabroad/utils/common_imports.dart';
import 'package:caregigsworkabroad/screens/_screen_controllers/home_screen_controller.dart';

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
                  SizedBox(
                    height: 100.h,
                    child: Center(
                      child: Row(
                        children: const [],
                      ),
                    ),
                  ),
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
                            padding: EdgeInsets.only(top: 90.sp),
                            child: Column(
                              children: [
                                Visibility(
                                  visible: false,
                                  child: Container(
                                    color: Colors.blue,
                                    height: 150,
                                    width: double.infinity,
                                  ),
                                ),
                                Visibility(
                                  visible: false,
                                  child: verticalSpacing(10),
                                ),
                                const FeedContainer()
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
              Obx(() => Visibility(
                    visible: controller.showImage.value,
                    child: GestureDetector(
                      onTap: () {
                        NavBarController.to
                            .hideNavBar(!NavBarController.to.hideNavBar.value);
                        controller.showImage(!controller.showImage.value);
                      },
                      child: Container(
                        color: Colors.black,
                        child: Column(
                          children: [
                            Expanded(
                              child: Image.asset(
                                controller.imageString.value,
                                fit: BoxFit.contain,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget createPostCard() {
    return customContainer(
      giveHeight: 100.sp,
      giveWidth: double.infinity,
      top: true,
      topLeft: 12,
      topRight: 12,
      bottom: true,
      bottomLeft: 12,
      bottomRight: 12,
      giveColor: Colors.white,
      containerChild: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.sp),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey,
            ),
            horizontalSpacing(5),
            Flexible(
              fit: FlexFit.tight,
              child: textField(
                  backgroundColor: AppTheme.primaryColor.withOpacity(0.1),
                  labelColor: AppTheme.commonTextColor,
                  fieldController: TextEditingController(),
                  giveHint: 'Write something here...',
                  alignLabelasHint: true,
                  onFieldEntry: null),
            )
          ],
        ),
      ),
    );
  }
}

class FeedContainer extends GetWidget<HomeScreenController> {
  const FeedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(top: 10.sp),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: 6,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(top: 10),
            child: customContainer(
                giveHeight: null,
                giveWidth: double.infinity,
                top: true,
                topLeft: 12,
                topRight: 12,
                bottom: false,
                giveColor: Colors.white,
                containerChild: Column(
                  children: [
                    Visibility(
                      visible: index % 2 == 0,
                      child: alignleft(
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: SizedBox(
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: 'Olivia',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              TextSpan(
                                text: ' commented on',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                              ),
                              TextSpan(
                                text: ' Kimara\'s',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              TextSpan(
                                text: ' Post',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                              ),
                            ])),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Column(
                          children: [
                            feedProfileCard(),
                            verticalSpacing(10),
                            SizedBox(
                              width: double.infinity,
                              child: text(
                                  giveText:
                                      """A 27 year old patient underwent a primary ceasarean section because of breech presentation 24 hours ago. Which assessment finding would be of most concern?
A) Small amount of koch is rubia
B) Temperature of 99 F
C) Slight redness of the left calf
D) Pain rated 3/10 in the incisional area
"""),
                            ),
                            verticalSpacing(10),
                            Visibility(
                              visible: true,
                              child: InkWell(
                                onTap: () {
                                  NavBarController.to.hideNavBar(
                                      !NavBarController.to.hideNavBar.value);
                                  controller
                                      .showImage(!controller.showImage.value);
                                  controller.imageString(
                                      'assets/caregigs_logo_1024 1.jpg');
                                },
                                child: Container(
                                  height: 300.sp,
                                  width: 400.sp,
                                  color: Colors.white,
                                  child: Image.asset(
                                    'assets/caregigs_logo_1024 1.jpg',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 5,
            );
          },
        ),
      ),
    );
  }

  Row feedProfileCard() {
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: AppTheme.primaryColor,
        ),
        horizontalSpacing(10),
        Flexible(
          fit: FlexFit.tight,
          flex: 9,
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      text(
                          giveText: 'Kimara',
                          fontsize: 14.sp,
                          fontweight: FontWeight.w500),
                      horizontalSpacing(10),
                      text(
                          giveText: 'Follow',
                          fontsize: 14.sp,
                          textColor: AppTheme.primaryColor,
                          fontweight: FontWeight.w500),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.access_time,
                        size: 18.sp, color: AppTheme.commonTextColor),
                    horizontalSpacing(5),
                    text(
                        giveText: '9 hours ago',
                        textColor: AppTheme.commonTextColor),
                  ],
                ),
              ],
            ),
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          flex: 1,
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: AppTheme.commonTextColor,
            ),
          ),
        ),
      ],
    );
  }
}
