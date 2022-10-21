import 'dart:io';

import 'package:caregigsworkabroad/screens/_screen_controllers/create_post_controller.dart';
import '../../../../../utils/common_imports.dart';

class CreatePostPage extends GetWidget<CreatePostController> {
  const CreatePostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: backArrow(giveIconSize: 20),
        titleSpacing: 0,
        elevation: 0.5,
        shadowColor: Colors.grey.shade50,
        title: text(
            giveText: 'Create Post', fontweight: FontWeight.w500, fontsize: 16),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.sp),
            child: button(
              borderRadius: 20,
              buttonColor: AppTheme.primaryColor,
              onPress: () {},
              buttonText: 'Post',
              textSize: 15,
              buttonTextColor: Colors.white,
            ),
          )
        ],
      ),
      body: Padding(
        padding:
            EdgeInsets.only(bottom: Get.context!.mediaQueryViewInsets.bottom),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                verticalSpacing(10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.sp),
                  child: SizedBox(
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: AppTheme.primaryColor,
                        ),
                        horizontalSpacing(10),
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 9,
                          child: SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                text(
                                    giveText: 'Kimara',
                                    fontsize: 16.sp,
                                    fontweight: FontWeight.w500),
                                Row(
                                  children: [
                                    customContainer(
                                        giveHeight: null,
                                        giveWidth: null,
                                        topLeft: 8,
                                        topRight: 8,
                                        bottomLeft: 8,
                                        bottomRight: 8,
                                        giveColor: Colors.blueGrey.shade50,
                                        containerChild: Padding(
                                          padding: EdgeInsets.all(5.sp),
                                          child: InkWell(
                                            onTap: () {
                                              privacyPreference(controller);
                                            },
                                            child: Obx(
                                              () => Row(
                                                children: [
                                                  Icon(
                                                    controller
                                                        .privacyList[controller
                                                            .selectedPrivacyIndex
                                                            .value]
                                                        .privacyIcons,
                                                    color: Colors.black87,
                                                    size: 15,
                                                  ),
                                                  horizontalSpacing(5),
                                                  text(
                                                      giveText: controller
                                                          .privacyList[controller
                                                              .selectedPrivacyIndex
                                                              .value]
                                                          .privacyText,
                                                      textColor: Colors.black87,
                                                      fontsize: 15),
                                                  horizontalSpacing(5),
                                                  const Icon(
                                                    Icons.arrow_drop_down,
                                                    color: Colors.black87,
                                                    size: 15,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                verticalSpacing(10),
                horizontalDividerWidget(Colors.grey.shade100, 1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: textField(
                      giveHeight: null,
                      fieldController: TextEditingController(),
                      giveHint: 'Type something here...',
                      labelColor: AppTheme.commonTextColor,
                      lableTextSize: 16,
                      borderColor: Colors.transparent,
                      fieldMaxLines: null,
                      backgroundColor: Colors.transparent,
                      onFieldEntry: null),
                ),
                verticalSpacing(20),
                Obx(
                  () => controller.imagePath.isNotEmpty &&
                          controller.imagePath.length <= 1
                      ? AspectRatio(
                          aspectRatio: 3 / 4,
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Container(
                                color: Colors.white,
                                child: Image.file(
                                  File(controller.imagePath[0].path),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  controller.imagePath.removeAt(0);
                                },
                                child: CircleAvatar(
                                  backgroundColor:
                                      Colors.black.withOpacity(0.7),
                                  radius: 15,
                                  child: const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      : controller.imagePath.isNotEmpty &&
                              controller.imagePath.length > 1
                          ? GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 3 / 4,
                                crossAxisCount: 3,
                                crossAxisSpacing: 0,
                                mainAxisSpacing: 0,
                              ),
                              itemCount: controller.imagePath.length,
                              itemBuilder: (c, i) {
                                return Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: ClipRRect(
                                        // height: 90,
                                        // width: 120,
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.file(
                                          File(controller.imagePath[i].path),
                                          // height: 90,
                                          // width: 120,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        controller.imagePath.removeAt(i);
                                      },
                                      child: const CircleAvatar(
                                        backgroundColor: Colors.red,
                                        radius: 12,
                                        child: Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              })
                          : const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        //   height: 90,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.sp),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  controller.getMultipleImageFromGallery();
                },
                icon: Icon(
                  Icons.photo_library_rounded,
                  color: Colors.pink,
                  size: 25.sp,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.camera_alt,
                  color: Colors.blue,
                  size: 25.sp,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.video_camera_back,
                  color: Colors.green,
                  size: 25.sp,
                ),
              ),
              Flexible(
                flex: 4,
                fit: FlexFit.tight,
                child: SizedBox(
                  height: 30,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.sp),
                    child: text(
                      giveText: 'Add to Your post',
                      textColor: AppTheme.commonTextColor,
                      fontsize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void privacyPreference(CreatePostController controller) {
  Get.bottomSheet(
      ListView.builder(
        shrinkWrap: true,
        itemCount: controller.privacyList.length,
        itemBuilder: (c, i) {
          return ListTile(
            onTap: () {
              controller.selectedPrivacyIndex(i);
              Get.back();
            },
            leading: Icon(
              controller.privacyList[i].privacyIcons,
              color: Colors.black87,
            ),
            title: text(giveText: controller.privacyList[i].privacyText),
          );
        },
      ),
      backgroundColor: Colors.white);
}
