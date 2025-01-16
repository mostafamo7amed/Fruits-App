import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/services/git_it_services.dart';
import 'package:fruits/core/utils/widgets/custom_progress_hud.dart';
import 'package:fruits/core/utils/widgets/custom_text_form_field.dart';
import 'package:fruits/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits/features/auth/presentation/view/widgets/custom_password_field.dart';
import 'package:fruits/features/auth/presentation/view/widgets/terms_and_conditions.dart';

import '../../../../constants.dart';
import '../../../../core/helper_functions/snack_bar.dart';
import '../../../../core/services/app_references.dart';
import '../../../../core/utils/app_manager/app_colors.dart';
import '../../../../core/utils/app_manager/app_styles.dart';
import '../../../../core/utils/widgets/build_app_bar.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../home/presentation/view/home_view.dart';
import '../cubits/signup_cubit/signup_cubit.dart';

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
      create: (context) => SignupCubit(getIt.get<AuthRepo>()),
      child:  BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is SignupSuccess) {
            AppReference.setData(key: authKey, data: true);
            showSnackBar(context, 'تم انشاء الحساب بنجاح');
            Navigator.pushReplacementNamed(context, HomeView.routeName);
          }
          if (state is SignupError) {
            showSnackBar(context, state.message);
          }
        },
        builder: (context, state) {
          return  CustomProgressHud(
            isLoading: state is SignupLoading ? true : false,
            child: Scaffold(
                appBar: buildAppBar(
                    context, title: 'حساب جديد', showBackButton: false),
                body: SingleChildScrollView(
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
                            validator: (value) {
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
                            validator: (value) {
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
                                      .read<SignupCubit>()
                                      .createUserWithEmailAndPassword(
                                      email: email, password: password,name: name);
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
                )
            ),
          );
        },
      ),
    );
  }
}
