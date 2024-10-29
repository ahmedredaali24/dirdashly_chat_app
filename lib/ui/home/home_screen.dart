import 'package:dirdashly/ui/auth/log_in/log_in_screen_email.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "HomeScreen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                GoogleSignIn googleSign = GoogleSignIn();
                await googleSign.signOut();
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushNamedAndRemoveUntil(
                    LogInScreenEmail.routeName, (route) => false);
              },
              icon: Icon(Icons.exit_to_app_outlined))
        ],
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: const Text("welcom"),
      ),
    );
  }
}
