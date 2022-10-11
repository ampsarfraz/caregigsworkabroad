import 'package:otp_text_field/style.dart';

import '../../utils/common_imports.dart';
import '../../services/signup_services.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';

class EmailVerification extends GetWidget<SignUpServices> {
  const EmailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return annotedRegion(
      Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Flexible(flex: 1, fit: FlexFit.tight, child: SizedBox()),
            Center(
              child: Image.asset(
                'assets/caregigs_logo_1024 1.jpg',
                scale: 1.2,
              ),
            ),
            verticalSpacing(30.sp),
            Flexible(
              fit: FlexFit.tight,
              flex: 3,
              child: Column(
                children: [
                  verticalSpacing(20.sp),
                  text(
                      giveText: 'Email Verification',
                      fontweight: FontWeight.bold,
                      fontsize: 20.sp),
                  verticalSpacing(10.sp),
                  text(
                      giveText: 'Please enter the 4-digit code sent to you at',
                      fontsize: 16.sp,
                      textColor: AppTheme.commonTextColor),
                  text(
                      giveText: 'xxxx@xxx.com',
                      fontsize: 16.sp,
                      textColor: AppTheme.commonTextColor),
                  verticalSpacing(30.sp),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.sp),
                    child: OTPTextField(
                      style: TextStyle(color: AppTheme.commonTextColor),
                      width: Get.width / 0.7,
                      fieldWidth: 50,
                      outlineBorderRadius: 5,
                      otpFieldStyle: OtpFieldStyle(
                        focusBorderColor: Colors.black,
                      ),
                      controller: OtpFieldController(),
                      length: 4,
                      fieldStyle: FieldStyle.box,
                      onChanged: (val) {},
                      onCompleted: (value) {},
                    ),
                  ),
                  verticalSpacing(15.sp),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.sp),
                    child: alignRight(
                      InkWell(
                        onTap: () {},
                        child: text(
                            giveText: 'Resend Code',
                            textColor: AppTheme.loginScreenPrimaryColor,
                            fontsize: 15.sp),
                      ),
                    ),
                  ),
                  verticalSpacing(20.sp),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.sp),
                    child: button(
                        buttonWidth: double.infinity,
                        buttonHeight: 60.sp,
                        buttonColor: AppTheme.loginScreenPrimaryColor,
                        onPress: () {
                          Get.focusScope!.unfocus();
                        },
                        buttonText: 'Submit',
                        textSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
