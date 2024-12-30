import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/services/git_it_services.dart';
import 'package:fruits/core/utils/widgets/custom_text_form_field.dart';
import 'package:fruits/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits/features/auth/presentation/view/widgets/terms_and_conditions.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/helper_functions/snack_bar.dart';
import '../../../../core/utils/app_manager/app_colors.dart';
import '../../../../core/utils/app_manager/app_styles.dart';
import '../../../../core/utils/widgets/build_app_bar.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../cubits/auth_cubit.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  static const routeName = 'signup';

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  late String name, email, password;
  bool isTermsChecked = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'حساب جديد', showBackButton: true),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {}
            if (state is AuthError) {
              showSnackBar(context, state.message);
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is AuthLoading ? true : false,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Form(
                    key: _formKey,
                    autovalidateMode: autoValidateMode,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 24,
                        ),
                        CustomTextFormField(
                          validator:  (value) {
                            if (value!.isEmpty) {
                              return 'الاسم كامل مطلوب';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            name = value!;
                          },
                          hintText: 'الاسم كامل',
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        CustomTextFormField(
                          validator:  (value) {
                            if (value!.isEmpty) {
                              return 'البريد الالكتروني مطلوب';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            email = value!;
                          },
                          hintText: 'البريد الالكتروني',
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        CustomPasswordFormField(

                          onSaved: (value) {
                            password = value!;
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TermsAndConditions(isChecked: (value) {
                          isTermsChecked = value;
                        }),
                        SizedBox(
                          height: 30,
                        ),
                        CustomButton(
                          text: 'إنشاء حساب جديد',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              autoValidateMode = AutovalidateMode.disabled;
                              if (isTermsChecked) {
                                context
                                    .read<AuthCubit>()
                                    .createUserWithEmailAndPassword(
                                        email: email, password: password);
                              } else {
                                showSnackBar(context,
                                    'يجب الموافقة على الشروط والاحكام');
                              }
                            } else {
                              autoValidateMode = AutovalidateMode.always;
                            }
                          },
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text.rich(
                          TextSpan(
                            text: 'تمتلك حساب بالفعل؟ ',
                            style: Styles.semiBold16
                                .copyWith(color: AppColor.lightGrayColor),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'تسجيل الدخول',
                                style: Styles.semiBold16
                                    .copyWith(color: AppColor.primaryColor),
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
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CustomPasswordFormField extends StatefulWidget {
  const CustomPasswordFormField({
    super.key,
    required this.onSaved,
  });
  final ValueChanged<String?> onSaved;

  @override
  State<CustomPasswordFormField> createState() =>
      _CustomPasswordFormFieldState();
}

class _CustomPasswordFormFieldState extends State<CustomPasswordFormField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      validator:  (value) {
        if (value!.isEmpty) {
          return 'كلمة المرور مطلوبة';
        }
        return null;
      },
      obscureText: isObscure,
      onSaved: (value) {
        widget.onSaved(value!);
        setState(() {});
      },
      hintText: 'كلمة المرور',
      keyboardType: TextInputType.visiblePassword,
      suffixIcon: IconButton(
        icon: Icon(
            !isObscure ? Icons.visibility_off : Icons.remove_red_eye_outlined),
        color: AppColor.lightGrayColor,
        onPressed: () {
          isObscure = !isObscure;
          setState(() {});
        },
      ),
    );
  }
}
