import '../../../../utils/common_imports.dart';

class CompleteProfileWidget extends StatelessWidget {
  const CompleteProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: false,
      child: Padding(
        padding: EdgeInsets.only(top: 10.sp),
        child: Container(
          color: const Color(0x0D3177D8),
          height: 150,
          width: double.infinity,
        ),
      ),
    );
  }
}
