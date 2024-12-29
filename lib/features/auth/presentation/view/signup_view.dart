import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits/core/utils/widgets/custom_text_form_field.dart';
import 'package:fruits/features/auth/presentation/view/widgets/terms_and_conditions.dart';

import '../../../../core/utils/app_manager/app_colors.dart';
import '../../../../core/utils/app_manager/app_styles.dart';
import '../../../../core/utils/widgets/build_app_bar.dart';
import '../../../../core/utils/widgets/custom_button.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const routeName = 'signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context, title: 'حساب جديد', showBackButton: true),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(
                  height: 24,
                ),
                CustomTextFormField(
                  controller: TextEditingController(),
                  hintText: 'الاسم كامل',
                  keyboardType: TextInputType.text,
                ),
                SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  controller: TextEditingController(),
                  hintText: 'البريد الالكتروني',
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  controller: TextEditingController(),
                  hintText: 'كلمة المرور',
                  keyboardType: TextInputType.visiblePassword,
                  suffixIcon: IconButton(
                    icon: Icon(Icons.remove_red_eye_outlined),
                    color: AppColor.lightGrayColor,
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                TermsAndConditions(),
                SizedBox(
                  height: 30,
                ),
                CustomButton(
                  text: 'إنشاء حساب جديد',
                  onPressed: () {
          
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                Text.rich(
                  TextSpan(
                    text: 'تمتلك حساب بالفعل؟ ',
                    style: Styles.semiBold16.copyWith(color: AppColor.lightGrayColor),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'تسجيل الدخول',
                        style: Styles.semiBold16.copyWith(
                            color: AppColor.primaryColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pop(context);
                          },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
