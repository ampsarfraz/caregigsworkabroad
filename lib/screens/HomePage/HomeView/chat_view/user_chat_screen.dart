import 'package:caregigsworkabroad/screens/_screen_controllers/user_chat_controller.dart';

import '../../../../utils/common_imports.dart';

class UserChat extends GetWidget<UserChatController> {
  const UserChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: backArrow(giveIconSize: 20),
            titleSpacing: 0,
            elevation: 0.5,
            shadowColor: Colors.grey.shade50,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: AppTheme.primaryColor,
                  radius: 18.sp,
                ),
                horizontalSpacing(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    text(
                        giveText: 'username',
                        fontweight: FontWeight.w500,
                        fontsize: 16),
                    //  / verticalSpacing(5),
                    text(
                        giveText: 'Last seen Today',
                        fontweight: FontWeight.w500,
                        textColor: AppTheme.commonTextColor,
                        fontsize: 12),
                  ],
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.star_border,
                  color: AppTheme.primaryColor,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.info_outline,
                  color: AppTheme.primaryColor,
                ),
              ),
            ],
          ),
          body: Scrollbar(
            child: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.sp),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: chatData.length,
                itemBuilder: (c, i) {
                  return chatData[i].messageType == 'image' &&
                          chatData[i].isMessageSent == false
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.send,
                                color: AppTheme.primaryColor,
                              ),
                            ),
                            horizontalSpacing(10),
                            InkWell(
                              onTap: () {
                                controller.showImage(true);
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  'assets/caregigs_logo_1024 1.jpg',
                                  height: 200.sp,
                                  width: 150.sp,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            // customContainer(
                            //   giveHeight: 200.sp,
                            //   giveWidth: 150.sp,
                            //   giveColor: AppTheme.primaryColor,
                            //   containerChild: null,
                            // ),
                            horizontalSpacing(10)
                          ],
                        )
                      : chatData[i].messageType == 'text' &&
                              chatData[i].isMessageSent == false
                          ? Padding(
                              padding: EdgeInsets.only(left: Get.width * 0.4),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                    fit: FlexFit.loose,
                                    child: customContainer(
                                      giveHeight: null,
                                      giveWidth: null,
                                      topLeft: 15,
                                      topRight: 15,
                                      bottomLeft: 15,
                                      bottomRight: 15,
                                      giveColor: AppTheme.primaryColor,
                                      containerChild: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.sp, vertical: 5.sp),
                                        child: text(
                                            giveText:
                                                'sent message sent messagesent messagesent messagesent message',
                                            textColor: Colors.white),
                                      ),
                                    ),
                                  ),
                                  horizontalSpacing(10)
                                ],
                              ),
                            )
                          : chatData[i].messageType == 'image' &&
                                  chatData[i].isMessageSent == true
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    horizontalSpacing(10),
                                    InkWell(
                                      onTap: () {
                                        controller.showImage(true);
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.asset(
                                          'assets/caregigs_logo_1024 1.jpg',
                                          height: 200.sp,
                                          width: 150.sp,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    // customContainer(
                                    //   giveHeight: 200.sp,
                                    //   giveWidth: 150.sp,
                                    //   giveColor: AppTheme.primaryColor,
                                    //   containerChild: null,
                                    // ),
                                    horizontalSpacing(10),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.send,
                                        color: AppTheme.primaryColor,
                                      ),
                                    ),
                                  ],
                                )
                              : chatData[i].messageType == 'text' &&
                                      chatData[i].isMessageSent == true
                                  ? Padding(
                                      padding: EdgeInsets.only(
                                          right: Get.width * 0.4),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          horizontalSpacing(10),
                                          Flexible(
                                            fit: FlexFit.loose,
                                            child: customContainer(
                                              giveHeight: null,
                                              giveWidth: null,
                                              topLeft: 15,
                                              topRight: 15,
                                              bottomLeft: 15,
                                              bottomRight: 15,
                                              giveColor: AppTheme.primaryColor,
                                              containerChild: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10.sp,
                                                    vertical: 5.sp),
                                                child: text(
                                                    giveText:
                                                        'recieved message recieved message recieved message recieved message',
                                                    textColor: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container();
                },
                separatorBuilder: (BuildContext context, int index) {
                  return verticalSpacing(10);
                },
              ),
            )),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: typeYourMessage(TextEditingController(), null),
          ),
        ),
        const ExpandableImageChatScreen()
      ],
    );
  }
}

Widget typeYourMessage(
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
                giveHint: 'Message...',
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

class ExpandableImageChatScreen extends GetWidget<UserChatController> {
  const ExpandableImageChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: controller.isImageOpened.value,
        child: GestureDetector(
          onTap: () {
            controller.showImage(false);
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
      ),
    );
  }
}

class ChatData {
  final String messageType;
  final bool isMessageSent;

  ChatData({required this.messageType, required this.isMessageSent});
}

List<ChatData> chatData = [
  ChatData(messageType: 'image', isMessageSent: false),
  ChatData(messageType: 'text', isMessageSent: false),
  ChatData(messageType: 'image', isMessageSent: true),
  ChatData(messageType: 'text', isMessageSent: true),
];
