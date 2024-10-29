import 'package:bloc/bloc.dart';

import 'package:dirdashly/ui/auth/register/cubit/states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../domin/use_case/register_use_case.dart';

class RegisterViewModel extends Cubit<RegisterStates> {
  RegisterUseCase registerUseCase;

  RegisterViewModel({required this.registerUseCase})
      : super(InitialRegisterState());

  final TextEditingController nameController =
      TextEditingController(text: "mnmnn");
  final TextEditingController emailController =
      TextEditingController(text: "aghjhjv@gmail.com");
  final TextEditingController passwordController =
      TextEditingController(text: "123456");
  final formKey = GlobalKey<FormState>();

  ///sendEmailVerification
  ///email verified
  emailVerified() async {
    await FirebaseAuth.instance.currentUser?.sendEmailVerification();
  }

  ///register by password
  register() async {
    if (formKey.currentState!.validate()) {
      emit(ShowLoadingRegisterState());
      try {
        Future.delayed(Duration(seconds: 2));
        var user = await registerUseCase.invoke(
            emailController.text, passwordController.text);

        if (user == null) {
          emit(SuccessRegisterState());
          return;
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          emit(ShowMessageRegisterState());
        } else if (e.code == 'email-already-in-use') {
          emit(ShowMessage2RegisterState());
        }
      } catch (e) {
        emit(ErrorRegisterState());
        print(e);
      }
    }
  }
}
