import 'package:dirdashly/domin/dependency_injection.dart';
import 'package:dirdashly/ui/auth/log_in/cubit/log_in_screen_view_model.dart';
import 'package:dirdashly/ui/auth/log_in/cubit/states.dart';
import 'package:dirdashly/ui/auth/log_in/log_in_screen_password.dart';
import 'package:dirdashly/ui/auth/register/register.dart';
import 'package:dirdashly/ui/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

import '../../utils/BackgroundImageContainer.dart';
import '../../utils/CustomRichText.dart';
import '../../utils/DividerRow.dart';
import '../../utils/dialog_widgets.dart';
import '../../utils/PrimaryButton.dart';
import '../../utils/PrimaryTextButton.dart';
import '../../utils/PrimaryTextFormField.dart';
import '../../utils/SecondaryButton.dart';
import '../../utils/app_colors.dart';
import '../../utils/image_assets.dart';

class LogInScreenEmail extends StatefulWidget {
  static const String routeName = "LogInScreenEmail";

  LogInScreenEmail({super.key});

  @override
  State<LogInScreenEmail> createState() => _LogInScreenEmailState();
}

class _LogInScreenEmailState extends State<LogInScreenEmail> {
  LogInScreenViewModel viewModel = LogInScreenViewModel(
      registerGoogleUseCase: injectRegisterGoogleUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: viewModel,
      listener: (context, state) {
        if (state is ShowLoadingState) {
          DialogWidgets.showLoading(
              context: context, massage: "loading", isDismissible: false);
        }
        if (state is SuccessLoginState) {
          DialogWidgets.hideLoading(context);
          Navigator.of(context)
              .pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);
        }
        if (state == ErrorLoginState) {
          Navigator.of(context).pop();
        }
      },
      child: BackgroundImageContainer(
          child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 235, right: 263, bottom: 15, left: 32),
              child:
                  Text('Log in', style: Theme.of(context).textTheme.titleLarge),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),

              ///main Container
              child: Container(
                width: 358,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.kSamiDarkColor.withOpacity(0.5),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.kSamiDarkColor.withOpacity(0.5),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Form(
                  key: viewModel.formKey,
                  child: Column(
                    children: [
                      ///text form field
                      PrimaryTextFormField(
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'please enter your email address';
                          }
                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value);
                          if (!emailValid) {
                            return 'invalid email';
                          }
                          return null;
                        },
                        hintText: 'Email',
                        controller: viewModel.emailController,
                        width: 326,
                        height: 48,
                        fillColor: AppColors.kLightAccentColor,
                      ),
                      const SizedBox(
                        height: 16,
                      ),

                      ///Next button
                      PrimaryButton(
                        onTap: () {
                          if (viewModel.formKey.currentState!.validate()) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LogInScreenPassword(
                                          email: viewModel.emailController.text,
                                        )));
                          }
                        },
                        borderRadius: 8,
                        fontSize: 14,
                        height: 48,
                        width: 326,
                        text: 'Next',
                        textColor: AppColors.kWhiteColor,
                        bgColor: AppColors.primaryColor,
                      ),
                      const SizedBox(
                        height: 16,
                      ),

                      ///textButton
                      PrimaryTextButton(
                        title: 'Forgot password?',
                        fontSize: 14,
                        onPressed: () {},
                        textColor: AppColors.darkPrimaryColor,
                      ),
                      const SizedBox(height: 32),
                      const DividerRow(),
                      const SizedBox(height: 32),
                      SecondaryButton(
                          onTap: () {
                            DialogWidgets.showModernDialog(
                              context,
                              title: "success",
                              buttonText: "go to Login screen",
                              message:
                                  "Your new account has been created successfully..",
                              onTapDismiss: () {},
                              type: PanaraDialogType.success,
                            );
                          },
                          borderRadius: 8,
                          fontSize: 14,
                          height: 48,
                          width: 326,
                          text: 'Login with Facebook',
                          textColor: AppColors.kBlackColor,
                          bgColor: AppColors.kLightAccentColor,
                          icons: AppImagePath.kLogoFacebook),
                      const SizedBox(height: 16),
                      SecondaryButton(
                          onTap: () async {
                            await viewModel.signInWithGoogle(context);
                          },
                          borderRadius: 8,
                          fontSize: 14,
                          height: 48,
                          width: 326,
                          text: 'Login with Google',
                          textColor: AppColors.kBlackColor,
                          bgColor: AppColors.kLightAccentColor,
                          icons: AppImagePath.kGoogleLogo),
                      const SizedBox(height: 32),
                      CustomRichText(
                        subtitle: ' Sign up ',
                        title: 'Don’t have an account?',
                        subtitleTextStyle: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                        onTab: () {
                          Navigator.of(context)
                              .pushReplacementNamed(RegisterScreen.routeName);
                        },
                      )
                    ],
                  ),
                ),
              ),
            )
          ]),
        ),
      )),
    );
  }
}
