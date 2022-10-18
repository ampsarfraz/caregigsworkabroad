import '../../utils/common_imports.dart';

class UserChatController extends GetxController {
  RxBool isImageOpened = false.obs;
  RxString imageString = 'assets/caregigs_logo_1024 1.jpg'.obs;
  showImage(bool value) {
    isImageOpened(value);
  }
}
