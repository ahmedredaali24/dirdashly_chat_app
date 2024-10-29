import 'package:dirdashly/domin/dependency_injection.dart';
import 'package:dirdashly/ui/auth/log_in/cubit/log_in_screen_view_model.dart';
import 'package:dirdashly/ui/auth/log_in/cubit/states.dart';
import 'package:dirdashly/ui/auth/log_in/log_in_screen_email.dart';
import 'package:dirdashly/ui/utils/dialog_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

import '../../home/home_screen.dart';
import '../../utils/BackgroundImageContainer.dart';
import '../../utils/CustomRichText.dart';
import '../../utils/PrimaryButton.dart';
import '../../utils/PrimaryTextButton.dart';
import '../../utils/PrimaryTextFormField.dart';
import '../../utils/app_colors.dart';

class LogInScreenPassword extends StatelessWidget {
  static const String routeName = "LogInScreenPassword";
  final String email;

  LogInScreenPassword({super.key, required this.email});

  final LogInScreenViewModel viewModel = LogInScreenViewModel(
      registerGoogleUseCase: injectRegisterGoogleUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: viewModel,
      listener: (context, state) {
        if (state is ShowLoadingState) {
          DialogWidgets.showLoading(context: context, massage: "Loading...");
        }
        if (state is SuccessLoginState) {
          DialogWidgets.hideLoading(context);
          Navigator.of(context).pushNamedAndRemoveUntil(
            HomeScreen.routeName,
            (routeName) => false,
          );
        }
        if (state is ShowMessageState) {
          DialogWidgets.showModernDialog(
            context,
            title: "emailVerified",
            message:
                "Your email is not Verified. \nPlease check your email to activate your account.",
            buttonText: "emailVerified",
            onTapDismiss: () {
              viewModel.emailVerified();
            },
            type: PanaraDialogType.warning,
          );
          print("emailVerified is not done");
        }
        if (state is ErrorLoginState) {
          DialogWidgets.showModernDialog(
            context,
            title: "error",
            message: "Your email or password is not found",
            buttonText: "try again!",
            onTapDismiss: () {},
            type: PanaraDialogType.error,
          );
        }
        if (state is HidingLoadingState) {
          DialogWidgets.hideLoading(context);
          DialogWidgets.showModernDialog(
            context,
            title: "error",
            message: "something error",
            buttonText: "try again!",
            onTapDismiss: () {},
            type: PanaraDialogType.error,
          );
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
                  key: viewModel.formKey2,
                  child: Column(
                    children: [
                      ///text form field
                      PrimaryTextFormField(
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'please enter password';
                          }
                          if (value.trim().length < 6 ||
                              value.trim().length > 30) {
                            return 'password should be >6 & <30';
                          }
                          return null;
                        },
                        hintText: 'Password',
                        controller: viewModel.passwordController,
                        width: 326,
                        height: 48,
                        fillColor: AppColors.kLightAccentColor,
                      ),
                      const SizedBox(
                        height: 16,
                      ),

                      ///continue button
                      PrimaryButton(
                        onTap: () async {
                          if (viewModel.formKey2.currentState!.validate()) {
                            await viewModel.passwordLogin(email);
                          }
                          print(email);
                        },
                        borderRadius: 8,
                        fontSize: 14,
                        height: 48,
                        width: 326,
                        text: 'Continue',
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
                      CustomRichText(
                        subtitle: ' email ',
                        title: 'change your email address?',
                        subtitleTextStyle: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                        onTab: () {
                          Navigator.of(context).pushNamed(
                            LogInScreenEmail.routeName,
                          );
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
