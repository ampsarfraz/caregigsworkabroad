import '../../utils/common_imports.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostController extends GetxController {
  RxBool isImageAdded = false.obs;
  RxList<XFile> imagePath = <XFile>[].obs;

  List<PostPrivacy> privacyList = <PostPrivacy>[
    PostPrivacy(privacyIcons: Icons.public, privacyText: 'Public'),
    PostPrivacy(privacyIcons: Icons.person, privacyText: 'Friends'),
    PostPrivacy(privacyIcons: Icons.public_off, privacyText: 'Only me'),
  ];
  RxInt selectedPrivacyIndex = 0.obs;
  Future getImagefromGallery() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    try {
      if (image != null) {
        imagePath.add(image);
      }
    } catch (err) {
      print(err);
      Get.snackbar("",
          "We are facing issue in loading your profile picture. Please try again after sometime. Sorry for your inconvenience.",
          colorText: AppTheme.commonTextColor, backgroundColor: Colors.white);
    }
  }

  Future getMultipleImageFromGallery() async {
    List<XFile> image = await ImagePicker().pickMultiImage();
    try {
      if (image.isNotEmpty) {
        imagePath.addAll(image);
      }
    } catch (err) {
      print(err);
      Get.snackbar("",
          "We are facing issue in loading your profile picture. Please try again after sometime. Sorry for your inconvenience.",
          colorText: AppTheme.commonTextColor, backgroundColor: Colors.white);
    }
  }
}

class PostPrivacy {
  final IconData privacyIcons;
  final String privacyText;

  PostPrivacy({required this.privacyIcons, required this.privacyText});
}
