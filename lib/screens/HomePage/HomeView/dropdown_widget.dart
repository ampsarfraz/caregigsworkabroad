import '../../../utils/common_imports.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class DropdownButtonWidget extends StatefulWidget {
  const DropdownButtonWidget({
    Key? key,
    // required this.text,
    // required this.index,
  }) : super(key: key);
  // final String text;
  // final int index;
  // final List<String> items;

  @override
  State<DropdownButtonWidget> createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      'Save Post',
      'Report Post',
      'Hide Post',
      'Copy Link'
    ];

    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        alignment: AlignmentDirectional.centerEnd,

        items: items
            .map(
              (item) => DropdownMenuItem<String>(
                value: item,
                child: text(giveText: item),
              ),
            )
            .toList(),
        //  value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value as String;
          });
        },
        icon: Icon(
          Icons.more_vert,
          color: AppTheme.commonTextColor,
        ),
        iconOnClick: Icon(
          Icons.more_vert,
          color: AppTheme.commonTextColor,
        ),
        buttonHeight: 50,
        //buttonWidth: 115,
        buttonPadding: const EdgeInsets.only(left: 14, right: 14),
        buttonElevation: 0,
        itemHeight: 40,
        itemPadding: const EdgeInsets.only(left: 14, right: 14),
        dropdownMaxHeight: 200,
        // dropdownWidth: 200,
        dropdownPadding: null,
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.white,
        ),
        dropdownElevation: 8,
        scrollbarRadius: const Radius.circular(40),
        scrollbarThickness: 6,
        scrollbarAlwaysShow: true,
        offset: const Offset(0, 0),
      ),
    );
  }
}
