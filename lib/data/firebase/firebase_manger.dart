import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseManger {
  FirebaseManger._();

  static FirebaseManger? _instance;

  static getInstance() {
    _instance ??= FirebaseManger._();
    // if(instance==null){
    //   instance==FirebaseManger();

    return _instance;
  }

  ///
  sendEmailVerificationMessage() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  ///register

  // register(String email, String password) async {
  //
  // }

  ///password
  Future signInWithPassword(String email, String password) async {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }
}
