import 'package:caregigsworkabroad/services/signup_services.dart';
import 'package:caregigsworkabroad/utils/common_imports.dart';

class SignupScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpServices());
  }
}
