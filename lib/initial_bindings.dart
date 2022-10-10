import 'package:caregigsworkabroad/screens/_screen_controllers/home_screen_controller.dart';
import 'package:caregigsworkabroad/services/endpoint_service.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenController());
    Get.put(EndpointService(), permanent: true);
  }
}
