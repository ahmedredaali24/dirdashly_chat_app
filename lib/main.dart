import 'package:bloc/bloc.dart';
import 'package:dirdashly/domin/dependency_injection.dart';
import 'package:dirdashly/ui/auth/log_in/cubit/log_in_screen_view_model.dart';
import 'package:dirdashly/ui/auth/log_in/log_in_screen_email.dart';

import 'package:dirdashly/ui/auth/log_in/personal_info.dart';
import 'package:dirdashly/ui/auth/register/register.dart';

import 'package:dirdashly/ui/home/home_screen.dart';
import 'package:dirdashly/ui/utils/thems.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';
import 'my_bloc_observe.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<LogInScreenViewModel>(
        create: (context) => LogInScreenViewModel(
            registerGoogleUseCase: injectRegisterGoogleUseCase())),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.myTheme,
      title: 'chat App',
      initialRoute: FirebaseAuth.instance.currentUser != null &&
              FirebaseAuth.instance.currentUser!.emailVerified
          ? HomeScreen.routeName
          : LogInScreenEmail.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        LogInScreenEmail.routeName: (context) => LogInScreenEmail(),
        // LogInScreenPassword.routeName: (context) => LogInScreenPassword(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        // OnBoardingScreen.routeName: (context) => OnBoardingScreen(),
        PersonalInfo.routeName: (context) => PersonalInfo()
      },
    );
  }
}
