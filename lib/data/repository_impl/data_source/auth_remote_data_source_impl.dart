import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dirdashly/data/firebase/db_firebase.dart';
import 'package:dirdashly/data/model/my_user.dart';
import 'package:dirdashly/domin/repository_interface/data_source/auth_remote_data_source_contract.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSourceContract {
  @override
  Future register(String email, String password, String userName) async {
    ///register by password
    var connectivityResult =
        await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      ///firebase Storage
      var user =
          MyUser(id: credential.user!.uid, userName: userName, email: email);
      DbFirebase.register(user);
    } else {
      print("Network error");
    }
  }

  @override
  Future<UserCredential?> registerByGoogle() async {
    // Trigger the authentication flow

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      return null;
    }

    ///firebase Storage
    var user = MyUser(
        id: googleUser.id,
        userName: googleUser.displayName ?? "Unknown",
        email: googleUser.email);
    DbFirebase.register(user);
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
