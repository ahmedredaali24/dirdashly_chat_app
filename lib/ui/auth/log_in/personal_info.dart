import 'package:dirdashly/ui/auth/log_in/log_in_screen_email.dart';
import 'package:dirdashly/ui/auth/log_in/log_in_screen_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

import '../../utils/BackgroundImageContainer.dart';
import '../../utils/CustomRichText.dart';
import '../../utils/dialog_widgets.dart';
import '../widgets/DateField.dart';
import '../widgets/PicProfileImgWidget.dart';
import '../../utils/PrimaryButton.dart';
import '../../utils/PrimaryTextFormField.dart';
import '../../utils/app_colors.dart';

class PersonalInfo extends StatelessWidget {
  static const String routeName = "PersonalInfo";

  PersonalInfo({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BackgroundImageContainer(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 235, right: 200, bottom: 15, left: 32),
            child: Text('Complete your information',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppColors.whiteColor, fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),

            ///main Container
            child: Container(
              width: 358,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
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
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("age:",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: AppColors.whiteColor,
                            )),
                    const SizedBox(
                      height: 16,
                    ),

                    ///text form field choose date
                    DateField(),
                    const SizedBox(
                      height: 16,
                    ),
                    Text("your picture:",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: AppColors.whiteColor,
                            )),
                    const SizedBox(
                      height: 16,
                    ),

                    ///the image
                    PicProfileImgWidget(),
                    const SizedBox(
                      height: 50,
                    ),

                    ///Next button
                    PrimaryButton(
                      onTap: () async {},
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
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    ));
  }
}
