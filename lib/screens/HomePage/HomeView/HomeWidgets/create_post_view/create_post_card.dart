import '../../../../../utils/common_imports.dart';

Widget createPostCard() {
  return Positioned(
    child: customContainer(
      giveHeight: 100.sp,
      giveWidth: double.infinity,
      top: true,
      topLeft: 12,
      topRight: 12,
      bottom: true,
      bottomLeft: 12,
      bottomRight: 12,
      giveColor: Colors.white,
      containerChild: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.sp),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey,
            ),
            horizontalSpacing(5),
            Flexible(
              fit: FlexFit.tight,
              child: textField(
                  onFieldTap: () {
                    Get.toNamed('CreatePost');
                  },
                  backgroundColor: AppTheme.primaryColor.withOpacity(0.1),
                  labelColor: AppTheme.commonTextColor,
                  fieldController: TextEditingController(),
                  giveHint: 'Write something here...',
                  isFieldReadOnly: true,
                  alignLabelasHint: true,
                  fieldMaxLines: null,
                  onFieldEntry: null),
            )
          ],
        ),
      ),
    ),
  );
}
