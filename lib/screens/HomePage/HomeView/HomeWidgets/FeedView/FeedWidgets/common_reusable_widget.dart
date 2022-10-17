import '../../../../../../utils/common_imports.dart';

Widget iconandTextWidget(
    {required IconData? buttonIcon,
    double buttonIconSize = 18,
    Color buttonIconColor = Colors.black,
    required void Function() onpress,
    double horizontalPadding = 0,
    double verticalPadding = 0,
    required Widget textWidget}) {
  return InkWell(
    onTap: onpress,
    child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding, vertical: verticalPadding),
      child: Row(
        children: [
          Visibility(
              visible: buttonIcon != null,
              child: Icon(buttonIcon,
                  size: buttonIconSize.sp, color: buttonIconColor)),
          horizontalSpacing(5),
          textWidget
        ],
      ),
    ),
  );
}
