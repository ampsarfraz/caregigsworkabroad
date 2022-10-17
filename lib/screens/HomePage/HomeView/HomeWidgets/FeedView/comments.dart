import 'package:caregigsworkabroad/screens/_screen_controllers/comments_controller.dart';
import '../../../../../utils/common_imports.dart';
import 'FeedWidgets/common_reusable_widget.dart';

class CommentsPage extends GetWidget<CommentsViewController> {
  const CommentsPage({super.key});

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
              itemCount: data.length,
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
                                  reactToComment(controller, i, data[i]),
                                  verticalSpacing(5),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.sp,
                                    ),
                                    child: ListView.separated(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: 5,
                                      shrinkWrap: true,
                                      itemBuilder: (c, i) {
                                        return commentReplies();
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return verticalSpacing(5);
                                      },
                                    ),
                                  ),
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
          child: Obx(() =>
              typeYourComment(controller, controller.comment.value, null)),
        ),
      ),
    );
  }
}

Widget commentReplies({bool isBackgroundShown = false}) {
  return customContainer(
    giveHeight: null,
    giveWidth: null,
    giveColor: isBackgroundShown ? Colors.grey.shade50 : Colors.transparent,
    topRight: 10,
    topLeft: 10,
    bottomLeft: 10,
    bottomRight: 10,
    containerChild: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        userProfile(
          giveRadius: 18,
        ),
        horizontalSpacing(5),
        Flexible(
          fit: FlexFit.tight,
          child: SizedBox(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Roseline',
                    style: textStyle(
                      fontsize: 14,
                      fontweight: FontWeight.w600,
                      textColor: Colors.black87,
                    ),
                  ),
                  TextSpan(
                    text: ' @Delphine',
                    style: textStyle(
                      fontsize: 14,
                      fontweight: FontWeight.normal,
                      textColor: AppTheme.primaryColor,
                    ),
                  ),
                  TextSpan(
                    text: ' $commentText',
                    style: textStyle(
                      fontsize: 14,
                      fontweight: FontWeight.normal,
                      textColor: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    ),
  );
}

Widget userProfile({double giveRadius = 25}) {
  return CircleAvatar(
    backgroundColor: AppTheme.primaryColor,
    radius: giveRadius.sp,
  );
}

Widget typeYourComment(GetxController controller,
    TextEditingController textController, FocusNode? textFocus) {
  return Container(
    //elevation: 1,
    color: Colors.white,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
      child: Row(
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: textField(
                fieldFocusNode: textFocus,
                onFieldTap: null,
                prefixWidget: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.attachment_rounded,
                    color: AppTheme.commonTextColor.withOpacity(0.3),
                  ),
                ),
                backgroundColor: Colors.grey.shade100,
                labelColor: Colors.black,
                fieldController: textController,
                giveHint: 'Type Here...',
                onFieldEntry: null,
                alignLabelasHint: true),
          ),
          horizontalSpacing(10.sp),
          CircleAvatar(
            backgroundColor: AppTheme.primaryColor,
            radius: 25,
            child: Center(
              child: iconWidget(Icons.send, Colors.white, 20.sp),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget reactToComment(
  GetxController controller,
  index,
  CommentBoolean listData,
) {
  return Row(
    children: [
      Obx(
        () => iconandTextWidget(
          verticalPadding: 10,
          buttonIcon:
              listData.selected.value ? Icons.favorite : Icons.favorite_border,
          buttonIconColor: AppTheme.primaryColor,
          onpress: () {
            listData.selected(!listData.selected.value);
            print(listData.selected.value);
          },
          textWidget: text(
            giveText: 'Beat',
            fontsize: 13,
            fontweight: FontWeight.w400,
            textColor: AppTheme.commonTextColor,
          ),
        ),
      ),
      horizontalSpacing(10),
      iconandTextWidget(
        verticalPadding: 10,
        buttonIcon: Icons.comment_bank_outlined,
        buttonIconColor: AppTheme.commonTextColor,
        onpress: () {
          Get.toNamed('replies', arguments: {'replyUsername': data[index].no});
          //controller.replyUsername(index.toString());
        },
        buttonIconSize: 15,
        textWidget: text(
          giveText: 'Reply',
          fontsize: 13,
          fontweight: FontWeight.w400,
          textColor: AppTheme.commonTextColor,
        ),
      ),
    ],
  );
}

Widget userNameandComment() {
  return customContainer(
      giveHeight: null,
      giveWidth: null,
      giveColor: Colors.grey.shade50,
      topRight: 10,
      topLeft: 10,
      bottomLeft: 10,
      bottomRight: 10,
      containerChild: SizedBox(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5.sp, horizontal: 10.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              text(
                  giveText: userName,
                  fontsize: 16,
                  textColor: Colors.black54,
                  fontweight: FontWeight.w600),
              verticalSpacing(5),
              text(
                  giveText: commentText,
                  textColor: Colors.black87,
                  fontsize: 14,
                  fontweight: FontWeight.w400)
            ],
          ),
        ),
      ));
}

String userName = 'Clairica';
String commentText =
    'Guys remember in the NCLEX world every perfect if something didn\'t mention in the question do not assume for those saying RN';

class CommentBoolean {
  final int no;
  RxBool selected = false.obs;
  CommentBoolean(this.no);
}

List<CommentBoolean> data = [
  CommentBoolean(0),
  CommentBoolean(1),
  CommentBoolean(2),
  CommentBoolean(3),
  CommentBoolean(4)
];
