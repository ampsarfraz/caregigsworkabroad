import 'package:caregigsworkabroad/screens/_screen_controllers/nav_bar_controller.dart';

import '../../utils/common_imports.dart';

class NavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavBarController());
  }
}
