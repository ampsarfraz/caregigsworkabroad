import '../../../../../utils/common_imports.dart';
import '../../../../_screen_controllers/home_screen_controller.dart';
import 'FeedWidgets/feed_image_widget.dart';
import 'FeedWidgets/feed_post_reaction.dart';
import 'FeedWidgets/feed_post_text.dart';
import 'FeedWidgets/feed_profile_card.dart';
import 'FeedWidgets/react_to_post.dart';

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
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Padding(
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: SizedBox(
                                      child: Column(
                                        children: [
                                          feedProfileCard(),
                                          verticalSpacing(10),
                                          feedPostText(),
                                          const FeedImageWidget(),
                                          feedPostReactions(),
                                        ],
                                      ),
                                    ),
                                  ),
                                  verticalSpacing(10),
                                  horizontalDividerWidget(
                                      AppTheme.commonTextColor.withOpacity(0.4),
                                      0.5),
                                  ReactToPost(index)
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return verticalSpacing(10);
              }),
        ),
      ),
    );
  }
}

class BeatBoolean extends GetxController {
  final int no;
  RxBool selected = false.obs;
  BeatBoolean(this.no);
}

List<BeatBoolean> data = [
  BeatBoolean(1),
  BeatBoolean(1),
  BeatBoolean(1),
  BeatBoolean(1),
  BeatBoolean(1)
];
