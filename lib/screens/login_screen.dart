import 'package:caregigsworkabroad/services/login_services.dart';
import 'package:caregigsworkabroad/utils/common_imports.dart';

class LoginScreen extends GetWidget<LoginService> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return annotedRegion(
      Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpacing(100.sp),
            Center(
              child: Image.asset(
                'assets/caregigs_logo_1024 1.jpg',
                scale: 1.2,
              ),
            ),
            verticalSpacing(30.sp),
            Column(
              children: [
                Form(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.sp),
                    child: Column(
                      children: [
                        textField(
                            fieldController: TextEditingController(),
                            giveHint: 'Email',
                            onFieldEntry: null,
                            borderColor: AppTheme.textFieldBorderColor,
                            labelColor: AppTheme.textFieldLableColor),
                        verticalSpacing(20.sp),
                        textField(
                            fieldController: TextEditingController(),
                            giveHint: 'Password',
                            onFieldEntry: null,
                            borderColor: AppTheme.textFieldBorderColor,
                            labelColor: AppTheme.textFieldLableColor),
                        verticalSpacing(10.sp),
                        alignRight(
                          InkWell(
                            onTap: () {},
                            child: text(
                                giveText: 'Forgot Password?',
                                textColor: AppTheme.loginScreenPrimaryColor,
                                fontsize: 15.sp),
                          ),
                        ),
                        verticalSpacing(25.sp),
                        button(
                            buttonWidth: double.infinity,
                            buttonHeight: 60.sp,
                            buttonColor: AppTheme.loginScreenPrimaryColor,
                            onPress: () {
                              Get.focusScope!.unfocus();
                            },
                            buttonText: 'Login Now',
                            textSize: 20),
                      ],
                    ),
                  ),
                ),
                verticalSpacing(15.sp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    text(
                        giveText: 'Don\'t have an account?',
                        fontsize: 20.sp,
                        textColor: const Color(0xff7D8183)),
                    horizontalSpacing(5),
                    InkWell(
                      onTap: () {
                        Get.focusScope!.unfocus();
                        Get.toNamed('signup');
                      },
                      child: text(
                          giveText: 'Apply Now',
                          fontsize: 20.sp,
                          textColor: const Color(0xff6597DB)),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
