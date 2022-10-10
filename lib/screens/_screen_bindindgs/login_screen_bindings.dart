import 'package:caregigsworkabroad/services/login_services.dart';
import 'package:get/get.dart';

class LoginScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginService());
  }
}
