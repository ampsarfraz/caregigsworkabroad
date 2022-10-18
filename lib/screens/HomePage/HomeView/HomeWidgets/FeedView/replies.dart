import 'package:caregigsworkabroad/screens/HomePage/HomeView/HomeWidgets/FeedView/comments.dart';
import 'package:caregigsworkabroad/screens/_screen_controllers/reply_view_controller.dart';
import '../../../../../utils/common_imports.dart';

class RepliesPage extends GetWidget<ReplyViewController> {
  const RepliesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return annotedRegion(
      Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: backArrow(giveIconSize: 20),
          titleSpacing: 0,
          elevation: 1,
          title: text(
              giveText: '15 comments',
              fontweight: FontWeight.w500,
              fontsize: 18),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: data.length - 6,
              itemBuilder: (context, i) {
                return SizedBox(
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          userProfile(),
                          horizontalSpacing(10),
                          Flexible(
                            fit: FlexFit.tight,
                            child: SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  userNameandComment(),
                                  reactToComment(controller, i, data[i]),
                                  verticalSpacing(10),
                                  Visibility(
                                      visible: i % 2 == 0,
                                      child: Obx(
                                        () => ListView.separated(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount:
                                              controller.viewMore.value ? 5 : 1,
                                          shrinkWrap: true,
                                          itemBuilder: (c, i) {
                                            return commentReplies(
                                                data: [1, 2],
                                                view: controller.viewMore);
                                          },
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return verticalSpacing(5);
                                          },
                                        ),
                                      )),
                                  verticalSpacing(5),
                                  Obx(() => Visibility(
                                        visible: controller.viewMore.value,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 10.sp),
                                          child: InkWell(
                                            onTap: () {
                                              controller.viewMore(false);
                                            },
                                            child: text(
                                                giveText: 'View less',
                                                fontsize: 12,
                                                fontweight: FontWeight.w500,
                                                textColor:
                                                    Colors.grey.shade700),
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return verticalSpacing(10);
              },
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Obx(() => typeYourComment(
              controller, controller.reply.value, controller.replyFocusNode)),
        ),
      ),
    );
  }
}
