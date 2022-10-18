import 'package:caregigsworkabroad/screens/_screen_controllers/user_chat_controller.dart';
import 'package:caregigsworkabroad/utils/common_imports.dart';

class UserChatBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(UserChatController());
  }
}
