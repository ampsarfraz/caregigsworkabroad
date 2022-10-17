import 'package:caregigsworkabroad/screens/_screen_controllers/reply_view_controller.dart';

import '../../utils/common_imports.dart';

class ReplyViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ReplyViewController());
  }
}
