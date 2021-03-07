import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:oriental_management/models/app_user.dart';
import 'package:oriental_management/screens/homepage_screen.dart';
import 'package:oriental_management/screens/register_screen.dart';
import 'package:oriental_management/services/auth_service.dart';
import 'package:oriental_management/services/database_service.dart';

import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthWrapper extends StatelessWidget {
  final firebaseAuth = FirebaseAuth.instance;
  final usersRef = FirebaseFirestore.instance.collection('users');

  // updateUserProfile({String uid, BuildContext context}) async {
  //   DocumentSnapshot doc = await usersRef.doc(uid).get();
  //   if (!doc.exists) {
  //     await Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => AddProfileScreen()));
  //   }
  // }

  Future<bool> checkAvailabledata(String uid) async {
    DocumentSnapshot doc = await usersRef.doc(uid).get();
    if (!doc.exists) {
      return true;
    } else {
      return false;
    }
    // return false;
    // bool availableData = !doc.exists;
    // return availableData;
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthServices>(context);
    return StreamBuilder<AppUser?>(
      stream: auth.onAuthChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          AppUser? user = snapshot.data;
          if (user == null) {
            return RegisterScreen();
            // } else if (!user.isVerified) {
            //   return EmailVerifyScreen();
          } else {
            //  updateUserProfile(uid: user.uid, context: context);
            //   if (checkAvailabledata(user.uid) == true) {
            //  return   Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) {
            //           return Provider<DataBase>(
            //               create: (context) => FireStoreDataBase(uid: user.uid),
            //               child: AddProfileScreen());
            //         },
            //       ),
            //     );
            //   } else {

            return Provider<DataBase>(
              create: (context) => FireStoreDataBase(uid: user.uid),
              child: HomeScreen(
                uid: user.uid,
              ),
            );
          }

          // MultiProvider(
          //   providers: [
          //     Provider<DataBase>(
          //       create: (context) => FireStoreDataBase(uid: user.uid),
          //     ),
          //     //  Provider<DataBase>(create: (context) => AddProfileScreen(),)
          //   ],
          //   child: HomeScreen(
          //     uid: user.uid,
          //   ),
          // );

          // Provider<DataBase>(
          //   create: (context) => FireStoreDataBase(uid: user.uid),
          //   child: HomeScreen(
          //     uid: user.uid,
          //   ),
          // child: AddProfileScreen(
          //   uid: user.uid,
          // ),
          // child: AddProfileScreen(
          //   uid: user.uid,
          // ),

          // firebaseAuth.currentUser.reload();
          // if (firebaseAuth.currentUser.emailVerified) {
          //   return Provider<DataBase>(
          //     create: (context) => FireStoreDataBase(uid: user.uid),
          //     child: HomeScreen(),
          //     // child: EmailVerifyScreen(),
          //   );
          // } else {
          //   return EmailVerifyScreen();
          // }
          //}
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
