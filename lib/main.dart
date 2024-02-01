import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libraryucic/cubit/auth_cubit.dart';
import 'package:libraryucic/cubit/page_cubit.dart';
import 'package:libraryucic/ui/pages/detail_pages.dart';
import 'package:libraryucic/ui/pages/getStarted_page.dart';
import 'package:libraryucic/ui/pages/main_page.dart';
import 'package:libraryucic/ui/pages/sign_in_page.dart';
import 'package:libraryucic/ui/pages/signup_page.dart';
import 'package:libraryucic/ui/pages/splash_page.dart';
import 'package:libraryucic/cubit/page_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: FirebaseOptions(
          apiKey: "AIzaSyAYdeoPYFz_sNq2VYMKbsJL34glJDMhREo",
          appId: "1:667136908623:android:4f96ad4e82b1d6c246b93a",
          messagingSenderId: "667136908623",
          projectId: "uciclibrary",
        ))
      : await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/get-started': (context) => GetStartedPage(),
          // '/detail-page' : (context) => DetailPage(),
          '/sign-up': (context) => SignUpPage(),
          '/sign-in' :(context) => SignInPage(),
          '/main': (context) => MainPage(),
        },
      ),
    );
  }
}
