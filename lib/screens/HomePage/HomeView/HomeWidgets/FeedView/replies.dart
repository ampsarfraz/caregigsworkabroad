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
              itemCount: data.length - 3,
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
                                children: [
                                  userNameandComment(),
                                  reactToComment(controller, i, data[i])
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
