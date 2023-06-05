import 'package:arsysfrontend/pages/ProfilePage.dart';
import 'package:arsysfrontend/pages/ResearchPage.dart';
import 'package:arsysfrontend/pages/SignInPage.dart';
import 'package:arsysfrontend/pages/SignUpPage.dart';
import 'package:arsysfrontend/pages/SpecializationPage.dart';
import 'package:arsysfrontend/pages/StudentPage.dart';
import 'package:arsysfrontend/pages/SupervisorPage.dart';
import 'package:arsysfrontend/provider/ProgramProvider.dart';
import 'package:arsysfrontend/provider/ProfileProvider.dart';
import 'package:arsysfrontend/provider/RegisterProvider.dart';
import 'package:arsysfrontend/provider/LoginProvider.dart';
import 'package:arsysfrontend/provider/ResearchProvider.dart';
import 'package:arsysfrontend/provider/ResearchReviewProvider.dart';
import 'package:arsysfrontend/provider/ResearchTypeProvider.dart';
import 'package:arsysfrontend/provider/SpecializationPivotProvider.dart';
import 'package:arsysfrontend/provider/StudentProvider.dart';
import 'package:arsysfrontend/provider/SupervisorProvider.dart';
import 'package:arsysfrontend/provider/auth/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:arsysfrontend/pages/HomePage.dart';
import 'package:arsysfrontend/pages/SplashPage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RegisterProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProgramProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => StudentProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SpecializationPivotProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SupervisorProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ResearchProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ResearchTypeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ResearchReviewProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/signin_page': (context) => SignInpage(),
          '/home_page': (context) => HomePage(),
          '/specialization_page': (context) => SpecializationPage(),
          '/signup_page': (context) => SignUpPage(),
          '/profile_page': (context) => ProfilePage(),
          '/student_page': (context) => StudentPage(),
          '/supervisor_page': (context) => SupervisorPage(),
          '/research_page': (context) => ResearchPage(),
        },
      ),
    );
  }
}
