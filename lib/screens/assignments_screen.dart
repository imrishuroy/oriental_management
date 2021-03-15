import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:oriental_management/models/app_user.dart';
import 'package:oriental_management/services/database_service.dart';
import 'package:oriental_management/widgets/nothing_here.dart';
import 'package:oriental_management/widgets/one_assignment_tile.dart';

class AssignmentScreen extends StatelessWidget {
  static String routeName = '/assignment-screen';
  final CollectionReference assignments =
      FirebaseFirestore.instance.collection('assignments');

  @override
  Widget build(BuildContext context) {
    final DataBase? database =
        ModalRoute.of(context)?.settings.arguments as DataBase;

    return FutureBuilder<DocumentSnapshot?>(
      future: database?.currentUserData,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Something went wrong...try Again!'),
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

          return StreamBuilder<DocumentSnapshot?>(
            stream: database?.assignmentStream(
                branch: '${user.branch}',
                sem: '${user.sem}',
                section: '${user.section}'),
            builder: (BuildContext context, assignmentSnapshot) {
              if (assignmentSnapshot.connectionState ==
                  ConnectionState.waiting) {
                return Scaffold(
                  backgroundColor: Color.fromRGBO(29, 38, 40, 1),
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              final int? lenghtOfAssignments =
                  assignmentSnapshot.data?.data()?['assignments']?.length;
              print('Assignment Length $lenghtOfAssignments');
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
                      radius: 14.4,
                      backgroundColor: Colors.grey,
                      child: Text(
                        '$lenghtOfAssignments',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
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
                    final String? subCode = assignmentSnapshot.data
                        ?.data()?['assignments'][index]['subCode'];
                    final String? subName = assignmentSnapshot.data
                        ?.data()?['assignments'][index]['subName'];
                    final String? assignmentName = assignmentSnapshot.data
                        ?.data()?['assignments'][index]['assignmentName'];
                    return Column(
                      children: [
                        SizedBox(height: 12.0),
                        OneAssignmentTile(
                          subCode: subCode,
                          subName: subName,
                          assignmentName: assignmentName,
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
        return NothingHere();
      },
    );
  }
}
