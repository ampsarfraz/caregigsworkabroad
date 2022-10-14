import '../../../../../../utils/common_imports.dart';
import '../../../../../_screen_controllers/home_screen_controller.dart';
import '../feed.dart';
import 'common_reusable_widget.dart';

class ReactToPost extends GetWidget<HomeScreenController> {
  const ReactToPost(this.index, {super.key});
  final int index;
  @override
  Widget build(BuildContext context) {
    return customContainer(
        top: false,
        bottom: false,
        giveHeight: null,
        giveWidth: double.infinity,
        giveColor: Colors.white,
        containerChild: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
                () => iconandTextWidget(
                  verticalPadding: 10,
                  buttonIcon: //controller.currentFeedIndex.value != index
                      data[index].selected.value == false
                          ? Icons.favorite_outline
                          : Icons.favorite,
                  buttonIconColor: AppTheme.primaryColor,
                  onpress: () {
                    data[index].selected(!data[index].selected.value);
                  },
                  textWidget: text(
                    giveText: 'Beat',
                    fontweight: FontWeight.w500,
                    textColor: Colors.black87,
                  ),
                ),
              ),
              verticalDividerWidget(
                  AppTheme.commonTextColor.withOpacity(0.4), 0.5,
                  giveHeight: 40),
              iconandTextWidget(
                verticalPadding: 10,
                buttonIcon: Icons.comment_outlined,
                buttonIconColor: AppTheme.primaryColor,
                onpress: () {
                  print('comment');
                  Get.toNamed('comments');
                },
                textWidget: text(
                  giveText: 'Comment',
                  fontweight: FontWeight.w500,
                  textColor: Colors.black87,
                ),
              ),
              verticalDividerWidget(
                  AppTheme.commonTextColor.withOpacity(0.4), 0.5,
                  giveHeight: 40),
              iconandTextWidget(
                verticalPadding: 10,
                buttonIcon: Icons.share_outlined,
                buttonIconColor: AppTheme.primaryColor,
                onpress: () {
                  print('share');
                },
                textWidget: text(
                  giveText: 'Share',
                  fontweight: FontWeight.w500,
                  textColor: Colors.black87,
                ),
              ),
            ],
          ),
        ));
  }
}
