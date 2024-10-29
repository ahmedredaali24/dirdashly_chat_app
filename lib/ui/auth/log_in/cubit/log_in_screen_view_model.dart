import 'package:bloc/bloc.dart';
import 'package:dirdashly/data/firebase/firebase_manger.dart';
import 'package:dirdashly/ui/auth/log_in/cubit/states.dart';
import 'package:dirdashly/ui/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../../../domin/use_case/register_google_use_case.dart';

class LogInScreenViewModel extends Cubit<LoginStates> {
  RegisterGoogleUseCase registerGoogleUseCase;

  LogInScreenViewModel({required this.registerGoogleUseCase})
      : super(InitialState());

  ///email verified
  emailVerified() async {
    await firebase.sendEmailVerificationMessage();
  }

  ///emailScreen
  var formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  FirebaseManger firebase = FirebaseManger.getInstance();

  ///passwordScreen
  final TextEditingController passwordController = TextEditingController();
  var formKey2 = GlobalKey<FormState>();

  ///registerByGoogle
  Future signInWithGoogle(context) async {
    try {
      var user = await registerGoogleUseCase.invoke();

      if (user == null) {
        return;
      }
      emit(ShowLoadingState());
      await Future.delayed(Duration(seconds: 3));
      emit(SuccessLoginState());
    } catch (e) {
      print("catch_Google : $e");
    }
  }

  ///passwordLogin//غير مكتمل
  passwordLogin(String email) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: passwordController.text);
      // var useObject = await DbFirebase.getUser(credential.user!.uid);

      if (FirebaseAuth.instance.currentUser!.emailVerified) {
        emit(ShowLoadingState());
        // if (useObject == null) {
        //   emit(HidingLoadingState());
        // }
        await Future.delayed(Duration(seconds: 3));
        emit(SuccessLoginState());
      } else {
        emit(ShowMessageState());
      }
    } catch (e) {
      emit(ErrorLoginState());
      print(e);
    }
  }
}
