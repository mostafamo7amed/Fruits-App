import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits/core/utils/app_manager/app_assets.dart';
import 'package:fruits/core/utils/app_manager/app_styles.dart';
import 'package:fruits/core/utils/widgets/build_app_bar.dart';
import 'package:fruits/core/utils/widgets/custom_text_form_field.dart';
import 'package:fruits/features/auth/presentation/view/signup_view.dart';
import 'package:fruits/features/auth/presentation/view/widgets/divider_widget.dart';
import 'package:fruits/features/auth/presentation/view/widgets/social_button.dart';

import '../../../../core/utils/app_manager/app_colors.dart';
import '../../../../core/utils/widgets/custom_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'تسجيل الدخول', showBackButton: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                onSaved: (p0) {},
                hintText: 'البريد الالكتروني',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (p0) {},
                hintText: 'كلمة المرور',
                keyboardType: TextInputType.visiblePassword,
                suffixIcon: IconButton(
                  icon: Icon(Icons.remove_red_eye_outlined),
                  color: AppColor.lightGrayColor,
                  onPressed: () {},
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                onPressed: () {},
                child: Text(
                  'نسيت كلمة المرور؟',
                  style: Styles.semiBold13.copyWith(
                      color: AppColor.primaryColor.withValues(alpha: 0.6)),
                ),
              ),
              CustomButton(
                onPressed: () {},
                text: "تسجيل دخول",
              ),
              SizedBox(
                height: 33,
              ),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: 'لا تمتلك حساب؟ ',
                    style: Styles.semiBold16
                        .copyWith(color: AppColor.lightGrayColor),
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context)
                                .pushNamed(SignupView.routeName);
                          },
                        text: 'قم بإنشاء حساب',
                        style: Styles.semiBold16
                            .copyWith(color: AppColor.primaryColor),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 33,
              ),
              DividerWidget(),
              SizedBox(
                height: 16,
              ),
              SocialButton(
                onPressed: () {},
                assetName: AssetsData.google,
                title: 'تسجيل بواسطة جوجل',
              ),
              SizedBox(
                height: 16,
              ),
              SocialButton(
                onPressed: () {},
                assetName: AssetsData.apple,
                title: 'تسجيل بواسطة أبل',
              ),
              SizedBox(
                height: 16,
              ),
              SocialButton(
                onPressed: () {},
                assetName: AssetsData.facebook,
                title: 'تسجيل بواسطة فيسبوك',
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
