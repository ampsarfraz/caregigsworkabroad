import 'package:caregigsworkabroad/screens/_screen_controllers/home_screen_controller.dart';

import '../../../../utils/common_imports.dart';
import '../../../_screen_controllers/nav_bar_controller.dart';

class ExtendedImage extends GetWidget<HomeScreenController> {
  const ExtendedImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Visibility(
          visible: controller.showImage.value,
          child: GestureDetector(
            onTap: () {
              NavBarController.to
                  .hideNavBar(!NavBarController.to.hideNavBar.value);
              controller.showImage(!controller.showImage.value);
            },
            child: Container(
              color: Colors.black,
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset(
                      controller.imageString.value,
                      fit: BoxFit.contain,
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
