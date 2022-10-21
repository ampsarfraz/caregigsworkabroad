import 'package:caregigsworkabroad/screens/_screen_controllers/create_post_controller.dart';
import 'package:caregigsworkabroad/utils/common_imports.dart';

class CreatePostbindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CreatePostController());
  }
}
