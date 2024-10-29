import 'package:dirdashly/domin/dependency_injection.dart';
import 'package:dirdashly/ui/auth/log_in/log_in_screen_email.dart';
import 'package:dirdashly/ui/auth/register/cubit/register_view_model.dart';
import 'package:dirdashly/ui/auth/register/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

import '../../utils/BackgroundImageContainer.dart';
import '../../utils/CustomRichText.dart';
import '../../utils/dialog_widgets.dart';
import '../../utils/PrimaryButton.dart';
import '../../utils/PrimaryTextFormField.dart';
import '../../utils/app_colors.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = "RegisterScreen";

  RegisterScreen({super.key});

  RegisterViewModel viewModel =
      RegisterViewModel(registerUseCase: injectRegisterUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: viewModel,
      listener: (context, state) {
        if (state is SuccessRegisterState) {
          DialogWidgets.showModernDialog(
            context,
            title: "success",
            buttonText: "done!",
            message:
                "Your new account has been created successfully.\nPlease check your email to activate your account.",
            onTapDismiss: () {
              viewModel.emailVerified;
              Navigator.of(context)
                  .pushReplacementNamed(LogInScreenEmail.routeName);
              print("object");
            },
            type: PanaraDialogType.success,
          );
        }
        if (state is ShowMessageRegisterState) {
          DialogWidgets.showModernDialog(
            onTapDismiss: () {},
            context,
            title: "success",
            buttonText: "try again!",
            message: "The password is too weak.",
            type: PanaraDialogType.warning,
          );
        }
        if (state is ShowMessage2RegisterState) {
          DialogWidgets.showModernDialog(context,
              onTapDismiss: () {},
              title: "info!",
              buttonText: "create new account!",
              message: "The account already exists for that email.",
              type: PanaraDialogType.warning,
              color: Colors.black);
        }
        if (state is ErrorRegisterState) {
          DialogWidgets.showModernDialog(
            onTapDismiss: () {},
            context,
            title: "error!",
            buttonText: "try again!",
            message: "something is wrong.",
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
              child: Text('Sign Up',
                  style: Theme.of(context).textTheme.titleLarge),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Let's create a new account for you.",
                          style: Theme.of(context).textTheme.titleSmall),
                      const SizedBox(
                        height: 16,
                      ),

                      ///text form field Name
                      PrimaryTextFormField(
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "please enter your name";
                          }
                          return null;
                        },
                        hintText: 'Name',
                        controller: viewModel.nameController,
                        width: 326,
                        height: 48,
                        fillColor: AppColors.kLightAccentColor,
                      ),
                      const SizedBox(
                        height: 16,
                      ),

                      ///text form field email
                      PrimaryTextFormField(
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'please enter your email address';
                          }
                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
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

                      ///text form field Password
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

                      ///Next button
                      PrimaryButton(
                        onTap: () async {
                          if (viewModel.formKey.currentState!.validate()) {
                            await viewModel.register();
                          }
                        },
                        borderRadius: 8,
                        fontSize: 14,
                        height: 48,
                        width: 326,
                        text: 'Create Account',
                        textColor: AppColors.kWhiteColor,
                        bgColor: AppColors.primaryColor,
                      ),
                      const SizedBox(
                        height: 16,
                      ),

                      const SizedBox(height: 32),
                      const SizedBox(height: 32),
                      Center(
                        child: CustomRichText(
                          subtitle: ' LogIn ',
                          title: ' Already have an account?',
                          subtitleTextStyle: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                          ),
                          onTab: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                LogInScreenEmail.routeName, (route) => false);
                          },
                        ),
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
