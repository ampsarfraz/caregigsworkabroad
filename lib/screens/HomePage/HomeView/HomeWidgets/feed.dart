import '../../../../utils/common_imports.dart';
import '../../../_screen_controllers/home_screen_controller.dart';
import '../../../_screen_controllers/nav_bar_controller.dart';

class FeedContainer extends GetWidget<HomeScreenController> {
  const FeedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(top: 0.sp),
        child: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            controller.direction = notification.direction;
            //  print(controller.direction);
            return true;
          },
          child: ListView.separated(
            controller: controller.feedController,
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(top: index == 0 ? 10.sp : 0),
              child: customContainer(
                  giveHeight: null,
                  giveWidth: double.infinity,
                  top: true,
                  topLeft: 12,
                  topRight: 12,
                  bottom: true,
                  giveColor: Colors.white,
                  shadow: true,
                  containerChild: Column(
                    children: [
                      Visibility(
                        visible: index % 2 == 0,
                        child: alignleft(
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.sp, vertical: 15.sp),
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
                      Visibility(
                        visible: index % 2 == 0,
                        child: horizontalDividerWidget(
                            AppTheme.commonTextColor.withOpacity(0.4), 0.5),
                      ),
                      verticalSpacing(10),
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: SizedBox(
                                  child: Column(
                                    children: [
                                      feedProfileCard(),
                                      verticalSpacing(10),
                                      feedPost(),
                                      feedImageWidget(),
                                      feedPostReactions(),
                                    ],
                                  ),
                                ),
                              ),
                              verticalSpacing(10),
                              horizontalDividerWidget(
                                  AppTheme.commonTextColor.withOpacity(0.4),
                                  0.5),
                              reactToFeed()
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            separatorBuilder: (BuildContext context, int index) {
              return verticalSpacing(10);
            },
          ),
        ),
      ),
    );
  }

  SizedBox feedPost() {
    return SizedBox(
      width: double.infinity,
      child: text(
          giveText:
              """A 27 year old patient underwent a primary ceasarean section because of breech presentation 24 hours ago. Which assessment finding would be of most concern?
A) Small amount of koch is rubia
B) Temperature of 99 F
C) Slight redness of the left calf
D) Pain rated 3/10 in the incisional area
      """),
    );
  }

  Widget reactToFeed() {
    return customContainer(
        top: false,
        bottom: false,
        giveHeight: null,
        giveWidth: double.infinity,
        giveColor: Colors.white,
        containerChild: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              iconandTextWidget(
                buttonIcon: Icons.favorite_outline,
                buttonIconColor: AppTheme.primaryColor,
                onpress: () {},
                textWidget: text(
                  giveText: 'Beat',
                  fontweight: FontWeight.w500,
                  textColor: Colors.black87,
                ),
              ),
              verticalDividerWidget(
                  AppTheme.commonTextColor.withOpacity(0.4), 0.5,
                  giveHeight: 40),
              iconandTextWidget(
                buttonIcon: Icons.comment_outlined,
                buttonIconColor: AppTheme.primaryColor,
                onpress: () {},
                textWidget: text(
                  giveText: 'Comment',
                  fontweight: FontWeight.w500,
                  textColor: Colors.black87,
                ),
              ),
              verticalDividerWidget(
                  AppTheme.commonTextColor.withOpacity(0.4), 0.5,
                  giveHeight: 40),
              iconandTextWidget(
                buttonIcon: Icons.share_outlined,
                buttonIconColor: AppTheme.primaryColor,
                onpress: () {},
                textWidget: text(
                  giveText: 'Share',
                  fontweight: FontWeight.w500,
                  textColor: Colors.black87,
                ),
              ),
            ],
          ),
        ));
  }

  Widget feedPostReactions() {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          iconandTextWidget(
            buttonIcon: Icons.favorite_outline,
            buttonIconColor: AppTheme.commonTextColor,
            onpress: () {},
            textWidget:
                text(giveText: '0 Beats', textColor: AppTheme.commonTextColor),
          ),
          SizedBox(
            child: Row(
              children: [
                iconandTextWidget(
                  buttonIcon: null,
                  onpress: () {},
                  textWidget: text(
                      giveText: '0 Shares',
                      textColor: AppTheme.commonTextColor),
                ),
                horizontalSpacing(10),
                iconandTextWidget(
                  buttonIcon: null,
                  onpress: () {},
                  textWidget: text(
                      giveText: '10 Comments',
                      textColor: AppTheme.commonTextColor),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget feedImageWidget() {
    return Visibility(
      visible: false,
      child: InkWell(
        onTap: () {
          NavBarController.to.hideNavBar(!NavBarController.to.hideNavBar.value);
          controller.showImage(!controller.showImage.value);
          controller.imageString('assets/caregigs_logo_1024 1.jpg');
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
    );
  }
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
              iconandTextWidget(
                  buttonIcon: Icons.access_time,
                  onpress: () {},
                  textWidget: text(
                      giveText: '9 hours ago',
                      textColor: AppTheme.commonTextColor),
                  buttonIconColor: AppTheme.commonTextColor),
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

Widget iconandTextWidget(
    {required IconData? buttonIcon,
    double buttonIconSize = 18,
    Color buttonIconColor = Colors.black,
    required void Function()? onpress,
    required Widget textWidget}) {
  return InkWell(
    onTap: onpress,
    child: Row(
      children: [
        Visibility(
            visible: buttonIcon != null,
            child: Icon(buttonIcon,
                size: buttonIconSize.sp, color: buttonIconColor)),
        horizontalSpacing(5),
        textWidget
      ],
    ),
  );
}
