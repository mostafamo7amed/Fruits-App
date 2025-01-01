import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/utils/app_manager/app_assets.dart';
import 'package:fruits/core/utils/app_manager/app_styles.dart';
import 'package:fruits/core/utils/widgets/build_app_bar.dart';
import 'package:fruits/core/utils/widgets/custom_progress_hud.dart';
import 'package:fruits/core/utils/widgets/custom_text_form_field.dart';
import 'package:fruits/features/auth/presentation/view/signup_view.dart';
import 'package:fruits/features/auth/presentation/view/widgets/custom_password_field.dart';
import 'package:fruits/features/auth/presentation/view/widgets/divider_widget.dart';
import 'package:fruits/features/auth/presentation/view/widgets/social_button.dart';
import '../../../../core/helper_functions/snack_bar.dart';
import '../../../../core/services/git_it_services.dart';
import '../../../../core/utils/app_manager/app_colors.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../domain/repos/auth_repo.dart';
import '../cubits/signIn_cubit/sign_in_cubit.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  static const routeName = 'login';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String? email, password;
  var formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(getIt.get<AuthRepo>()),
      child: BlocConsumer<SignInCubit, SignInState>(listener: (context, state) {
        if (state is SignInSuccess) {}
        if (state is SignInError) {
          showSnackBar(context, state.message);
        }
      }, builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is SignInLoading ? true : false,
          child: Scaffold(
              appBar: buildAppBar(context,
                  title: 'تسجيل الدخول', showBackButton: false),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Form(
                    key: formKey,
                    autovalidateMode: autoValidateMode,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 24,
                        ),
                        CustomTextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'البريد الالكتروني مطلوب';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            email = value;
                          },
                          hintText: 'البريد الالكتروني',
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        CustomPasswordFormField(
                          onSaved: (value) {
                            password = value;
                          },
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: () {},
                          child: Text(
                            'نسيت كلمة المرور؟',
                            style: Styles.semiBold13.copyWith(
                                color: AppColor.primaryColor
                                    .withValues(alpha: 0.6)),
                          ),
                        ),
                        CustomButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              BlocProvider.of<SignInCubit>(context)
                                  .loginWithEmailAndPassword(
                                      email: email!, password: password!);
                              autoValidateMode = AutovalidateMode.disabled;
                            } else {
                              autoValidateMode = AutovalidateMode.always;
                            }
                          },
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
                          onPressed: () {
                            context.read<SignInCubit>().signInWithGoogle();
                          },
                          assetName: AssetsData.google,
                          title: 'تسجيل بواسطة جوجل',
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        if(Platform.isIOS)
                        Column(
                          children: [
                            SocialButton(
                              onPressed: () {},
                              assetName: AssetsData.apple,
                              title: 'تسجيل بواسطة أبل',
                            ),
                            SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                        SocialButton(
                          onPressed: () {
                            context.read<SignInCubit>().signInWithFacebook();
                          },
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
              )),
        );
      }),
    );
  }
}
