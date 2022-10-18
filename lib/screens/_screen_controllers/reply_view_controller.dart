import '../../utils/common_imports.dart';

class ReplyViewController extends GetxController {
  late Rx<TextEditingController> reply;
  late FocusNode replyFocusNode;

  replyUsername(userTag) {
    reply.value.text = '@$userTag';
    reply.value.selection = TextSelection.fromPosition(
        TextPosition(offset: reply.value.text.length));
    replyFocusNode.requestFocus();
  }

  RxBool viewMore = false.obs;

  @override
  void onInit() {
    reply = TextEditingController().obs;
    replyFocusNode = FocusNode();

    if (Get.arguments != null && Get.arguments['replyUsername'] != null) {
      replyUsername(Get.arguments['replyUsername']);
    }
    super.onInit();
  }
}
