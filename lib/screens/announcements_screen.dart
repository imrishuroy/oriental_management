import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:oriental_management/models/app_user.dart';

import 'package:oriental_management/services/database_service.dart';

import 'package:oriental_management/widgets/announcement_tile.dart';
import 'package:oriental_management/widgets/nothing_here.dart';

class AnnouncemetScreen extends StatelessWidget {
  static String routeName = '/announcement-screen';

  @override
  Widget build(BuildContext context) {
    final DataBase? database =
        ModalRoute.of(context)?.settings.arguments as DataBase;
    return FutureBuilder<DocumentSnapshot?>(
      future: database?.currentUserData,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return NothingHere(
            appBarTitle: 'Assignments',
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: Color.fromRGBO(29, 38, 40, 1),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.data?.exists == true) {
          // checks weather user has added their profile
          AppUser user = AppUser.fromDocument(snapshot.data!);
          print(user.branch);
          print(user.sem);

          return StreamBuilder<DocumentSnapshot?>(
            stream: database?.announcementStream(
              branch: '${user.branch}',
              sem: '${user.sem}',
            ),
            builder: (BuildContext context, announcementSnapshot) {
              if (announcementSnapshot.connectionState ==
                  ConnectionState.waiting) {
                return Scaffold(
                  backgroundColor: Color.fromRGBO(29, 38, 40, 1),
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              print(announcementSnapshot.data?.data());
              final int? lenghtOfAssignments =
                  announcementSnapshot.data?.data()?['announcements']?.length;
              // print('Assignment Length $lenghtOfAssignments');
              if (lenghtOfAssignments == null) {
                return NothingHere(
                  appBarTitle: 'Announcements',
                );
              }
              return Scaffold(
                backgroundColor: Color.fromRGBO(29, 38, 40, 1),
                appBar: AppBar(
                  actions: [
                    CircleAvatar(
                      radius: 14.0,
                      backgroundColor: Colors.white,
                      child: Text(
                        '$lenghtOfAssignments',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 20.0),
                  ],
                  centerTitle: true,
                  backgroundColor: Color.fromRGBO(0, 141, 82, 1),
                  title: Text('Assignments'),
                ),
                body: ListView.builder(
                  //  shrinkWrap: true,
                  itemCount: lenghtOfAssignments,
                  itemBuilder: (context, index) {
                    print(announcementSnapshot.data?.data()?[index]);
                    final String? title = announcementSnapshot.data
                        ?.data()?['announcements'][index]['title'];
                    final String? message = announcementSnapshot.data
                        ?.data()?['announcements'][index]['message'];
                    final String? date = announcementSnapshot.data
                        ?.data()?['announcements'][index]['date'];

                    return Column(
                      children: [
                        SizedBox(height: 12.0),
                        AnnouncementTile(
                          title: title,
                          message: message,
                          date: date,
                        ),
                        // SizedBox(height: 7.0),
                      ],
                    );
                  },
                ),
              );
            },
          );
        }
        return NothingHere(
          appBarTitle: 'Assignments',
        );
      },
    );
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:oriental_management/services/app_database_service.dart';

// import 'package:oriental_management/widgets/announcement_tile.dart';
// import 'package:oriental_management/widgets/nothing_here.dart';
// import 'package:provider/provider.dart';

// class AnnouncemetScreen extends StatelessWidget {
//   static String routeName = '/announcement-screen';

//   @override
//   Widget build(BuildContext context) {
//     final appDataBase = Provider.of<AppDataBase>(context, listen: false);
//     return StreamBuilder<DocumentSnapshot?>(
//       stream: appDataBase.announcementStream,
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return NothingHere();
//         }
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Scaffold(
//             backgroundColor: Color.fromRGBO(29, 38, 40, 1),
//             body: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         }
//         final int? announcementLength =
//             snapshot.data?.data()?['announcements'].length;
//         return Scaffold(
//           backgroundColor: Color.fromRGBO(29, 38, 40, 1),
//           appBar: AppBar(
//             backgroundColor: Color.fromRGBO(0, 141, 82, 1),
//             centerTitle: true,
//             title: Text('Announcements'),
//             actions: [
//               CircleAvatar(
//                 radius: 14.0,
//                 backgroundColor: Colors.white,
//                 child: Text(
//                   '$announcementLength',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               SizedBox(width: 20.0),
//             ],
//           ),
//           body: ListView.builder(
//             itemCount: announcementLength,
//             itemBuilder: (context, index) {
//               final String? date =
//                   snapshot.data?.data()?['announcements'][index]['date'];
//               final String? title =
//                   snapshot.data?.data()?['announcements'][index]['title'];
//               final String? message =
//                   snapshot.data?.data()?['announcements'][index]['message'];
//               return Column(
//                 children: [
//                   SizedBox(height: 15.0),
//                   AnnouncementTile(
//                     date: '$date',
//                     title: '$title',
//                     message: '$message',
//                   ),
//                 ],
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }
