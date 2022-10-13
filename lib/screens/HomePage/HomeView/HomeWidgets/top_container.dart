import 'package:caregigsworkabroad/screens/_screen_controllers/home_screen_controller.dart';

import '../../../../utils/common_imports.dart';

class TopContainer extends GetWidget<HomeScreenController> {
  const TopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: controller.hContainer.value.h,
        child: Visibility(
          visible: controller.hContainer.value > 30,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  topContainerIconButton(
                      onPress: () {}, buttonIcon: Icons.search),
                  topContainerIconButton(
                      onPress: () {},
                      buttonIcon: Icons.notifications_none_outlined),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget topContainerIconButton(
    {required void Function()? onPress, required IconData buttonIcon}) {
  return CircleAvatar(
    backgroundColor: Colors.white.withOpacity(0.3),
    radius: 25,
    child: Center(
      child: IconButton(
        onPressed: onPress,
        icon: Icon(
          buttonIcon,
          color: Colors.white,
          size: 25,
        ),
      ),
    ),
  );
}
