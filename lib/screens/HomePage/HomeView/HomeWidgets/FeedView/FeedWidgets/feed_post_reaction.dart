import '../../../../../../utils/common_imports.dart';
import 'common_reusable_widget.dart';

Widget feedPostReactions() {
  return SizedBox(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        iconandTextWidget(
          verticalPadding: 10,
          buttonIcon: Icons.favorite_outline,
          buttonIconColor: AppTheme.commonTextColor,
          onpress: () {
            print('object');
          },
          textWidget:
              text(giveText: '0 Beats', textColor: AppTheme.commonTextColor),
        ),
        SizedBox(
          child: Row(
            children: [
              iconandTextWidget(
                buttonIcon: null,
                onpress: () {},
                textWidget: text(
                    giveText: '0 Shares', textColor: AppTheme.commonTextColor),
              ),
              horizontalSpacing(10),
              iconandTextWidget(
                buttonIcon: null,
                onpress: () {},
                textWidget: text(
                    giveText: '10 Comments',
                    textColor: AppTheme.commonTextColor),
              )
            ],
          ),
        )
      ],
    ),
  );
}
