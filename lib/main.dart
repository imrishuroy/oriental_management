import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oriental_management/screens/add_profile_screen.dart';

import 'package:oriental_management/screens/announcements_details_screen.dart';
import 'package:oriental_management/screens/announcements_screen.dart';
import 'package:oriental_management/screens/assignments_screen.dart';
import 'package:oriental_management/screens/attendance_screen.dart';
import 'package:oriental_management/screens/homepage_screen.dart';
import 'package:oriental_management/screens/lecture_selection_screen.dart';

import 'package:oriental_management/screens/old_lectures_screen.dart';
import 'package:oriental_management/screens/login_screen.dart';
import 'package:oriental_management/screens/success_screen.dart';
import 'package:oriental_management/services/app_database_service.dart';
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
    return MultiProvider(
      providers: [
        Provider<AuthServices>(create: (context) => Auth()),
        Provider<AppDataBase>(create: (context) => FirebaseDataBase()),
      ],
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
          AttendanceScreen.routeName: (ctx) => AttendanceScreen(),
          LectureSelection.routeName: (ctx) => LectureSelection(),
          AnnouncemetScreen.routeName: (ctx) => AnnouncemetScreen(),
          AnnouncementDetailScreen.routeName: (ctx) =>
              AnnouncementDetailScreen(),
          AssignmentScreen.routeName: (ctx) => AssignmentScreen(),

          //   NewAttendanceScreen.routeName: (ctx) => NewAttendanceScreen(),
        },
      ),
    );
  }
}
