import '../../../../../../utils/common_imports.dart';
import '../../../../../_screen_controllers/home_screen_controller.dart';
import '../../../../../_screen_controllers/nav_bar_controller.dart';

class FeedImageWidget extends GetWidget<HomeScreenController> {
  const FeedImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: false,
      child: InkWell(
        onTap: () {
          NavBarController.to.hideNavBar(!NavBarController.to.hideNavBar.value);
          controller.showImage(!controller.showImage.value);
          controller.imageString('assets/caregigs_logo_1024 1.jpg');
        },
        child: Container(
          height: 300.sp,
          width: 400.sp,
          color: Colors.white,
          child: Image.asset(
            'assets/caregigs_logo_1024 1.jpg',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
