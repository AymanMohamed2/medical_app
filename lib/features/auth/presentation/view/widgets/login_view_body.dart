import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/enums/signup_method_enum.dart';
import 'package:medical_app/core/functions.dart';
import 'package:medical_app/core/strategies/auth_navigation_factory.dart';
import 'package:medical_app/core/strategies/complete_data_factory.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/core/utils/app_validators.dart';
import 'package:medical_app/core/widgets/custom_button.dart';
import 'package:medical_app/core/widgets/custom_text_form_field.dart';
import 'package:medical_app/features/auth/presentation/view/choose_rule_view.dart';
import 'package:medical_app/features/auth/presentation/view/widgets/app_logo_section.dart';
import 'package:medical_app/features/auth/presentation/view/widgets/or_with_section.dart';
import 'package:medical_app/features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: loginListener,
      builder: (context, state) {
        return PopScope(
          canPop: state is! LoginLoading,
          child: ModalProgressHUD(
            dismissible: state is LoginLoading,
            inAsyncCall: state is LoginLoading,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 10),
                    AppLogoSection(),
                    SizedBox(height: 50),
                    LoginFormSection(
                      formKey: _formKey,
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: RichText(
                        text: TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                          children: [
                            TextSpan(
                              text: 'Register',
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ChooseRuleView()));
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 60),
                    OrWithSection(
                      googleOnTap: () => context
                          .read<LoginCubit>()
                          .login(AuthMethodEnum.google),
                      facebookOnTap: () => context
                          .read<LoginCubit>()
                          .login(AuthMethodEnum.facebook),
                      title: AppStrings.orLoginWith,
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void loginListener(BuildContext context, LoginState state) {
    if (state is LoginSuccess) {
      if (state.userModel.isCompeleteData) {
        AuthNavigationFactory.create(state.userModel)
            .executeNavigation(context);
      } else {
        CompleteDataNavigationFactory.create(state.userModel)
            .excuteNavigation(context);
      }
    } else if (state is LoginFailure) {
      customErrorSnakeBar(context, state.failure);
    }
  }
}

class LoginFormSection extends StatefulWidget {
  const LoginFormSection({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  State<LoginFormSection> createState() => _LoginFormSectionState();
}

class _LoginFormSectionState extends State<LoginFormSection> {
  bool isActive = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppStrings.loginAccount, style: AppStyles.bold20(context)),
          SizedBox(height: 15),
          CustomTextField(
            onChanged: context.read<LoginCubit>().setEmail,
            validator: AppValidators.validateEmail,
            hintText: AppStrings.enterEmail,
          ),
          SizedBox(height: 20),
          StatefulBuilder(
            builder: (context, setState) => CustomTextField(
              onChanged: context.read<LoginCubit>().setPassword,
              validator: AppValidators.passwordValidator,
              obscureText: isActive,
              suffixIcon: IconButton(
                  onPressed: () {
                    isActive = !isActive;
                    setState(() {});
                  },
                  icon: isActive
                      ? Icon(
                          Icons.visibility_off,
                          color: AppColors.inactiveColor,
                        )
                      : Icon(
                          Icons.visibility,
                          color: AppColors.primaryColor,
                        )),
              hintText: AppStrings.enterPass,
            ),
          ),
          SizedBox(height: 20),
          CustomButton(
            text: AppStrings.login,
            textStyle:
                AppStyles.medium24(context).copyWith(color: Colors.white),
            onPressed: () {
              if (widget.formKey.currentState!.validate()) {
                context.read<LoginCubit>().login(AuthMethodEnum.email);
              }
            },
          ),
        ],
      ),
    );
  }
}
