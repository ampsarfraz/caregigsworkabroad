import 'package:caregigsworkabroad/utils/common_imports.dart';

class CommentsViewController extends GetxController {
  late Rx<TextEditingController> comment;

  // replyUsername(userTag) {
  //   reply.value.text = '@$userTag';
  // }

  @override
  void onInit() {
    comment = TextEditingController().obs;
    super.onInit();
  }

  @override
  void dispose() {
    comment.close();
    //reply.close();
    super.dispose();
  }
}
