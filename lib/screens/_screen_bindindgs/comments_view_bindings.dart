import 'package:caregigsworkabroad/screens/_screen_controllers/comments_controller.dart';
import 'package:get/get.dart';

class CommentsViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CommentsViewController());
  }
}
