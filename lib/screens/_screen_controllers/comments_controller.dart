import 'package:caregigsworkabroad/utils/common_imports.dart';

class CommentsViewController extends GetxController {
  late Rx<TextEditingController> comment;

  // replyUsername(userTag) {
  //   reply.value.text = '@$userTag';
  // }
  RxBool showMoreReplies = false.obs;
  @override
  void onInit() {
    comment = TextEditingController().obs;
    super.onInit();
  }

  RxBool viewMore = false.obs;
  List replyData = [1, 2, 3, 4];

  @override
  void dispose() {
    comment.close();
    //reply.close();
    super.dispose();
  }
}
