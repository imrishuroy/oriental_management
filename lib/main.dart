import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oriental_management/screens/add_profile_screen.dart';
import 'package:oriental_management/screens/homepage_screen.dart';
import 'package:oriental_management/screens/lectures_screen.dart';
import 'package:oriental_management/screens/login_screen.dart';
import 'package:oriental_management/screens/success_screen.dart';
import 'package:oriental_management/services/auth_service.dart';
import 'package:oriental_management/services/auth_wrapper.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AuthServices>(
      create: (context) => Auth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Orienatal App',
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AuthWrapper(),
        routes: {
          HomeScreen.routeName: (ctx) => HomeScreen(),
          AddProfileScreen.routeName: (ctx) => AddProfileScreen(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
          SuccusScreen.routeName: (ctx) => SuccusScreen(),
          AddProfileScreen.routeName: (ctx) => AddProfileScreen(),
          LeactureScreeen.routeName: (ctx) => LeactureScreeen(),
        },
      ),
    );
  }
}
