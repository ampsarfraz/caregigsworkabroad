import '../../../../../../utils/common_imports.dart';
import 'common_reusable_widget.dart';

Row feedProfileCard() {
  return Row(
    children: [
      CircleAvatar(
        radius: 25,
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
              SizedBox(
                child: Row(
                  children: [
                    text(
                        giveText: 'Kimara',
                        fontsize: 14.sp,
                        fontweight: FontWeight.w500),
                    horizontalSpacing(10),
                    text(
                        giveText: 'Follow',
                        fontsize: 14.sp,
                        textColor: AppTheme.primaryColor,
                        fontweight: FontWeight.w500),
                  ],
                ),
              ),
              iconandTextWidget(
                  buttonIcon: Icons.access_time,
                  onpress: () {},
                  textWidget: text(
                      giveText: '9 hours ago',
                      textColor: AppTheme.commonTextColor),
                  buttonIconColor: AppTheme.commonTextColor),
            ],
          ),
        ),
      ),
      Flexible(
        fit: FlexFit.tight,
        flex: 1,
        child: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_vert,
            color: AppTheme.commonTextColor,
          ),
        ),
      ),
    ],
  );
}
