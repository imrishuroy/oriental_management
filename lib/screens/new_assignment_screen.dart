import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:oriental_management/models/app_user.dart';

import 'package:oriental_management/services/database_service.dart';
import 'package:oriental_management/widgets/one_assignment_tile.dart';

class NewAssignmentScreen extends StatefulWidget {
  final DataBase? database;

  const NewAssignmentScreen({
    Key? key,
    this.database,
  }) : super(key: key);

  @override
  _NewAssignmentScreenState createState() => _NewAssignmentScreenState();
}

class _NewAssignmentScreenState extends State<NewAssignmentScreen> {
  String? branch;
  String? sem;
  String? section;
  bool? isLoading = false;
  @override
  void initState() {
    getCurrentUserData();
    super.initState();
  }

  getCurrentUserData() async {
    setState(() {
      isLoading = true;
    });
    DocumentSnapshot? doc = await widget.database?.currentUserData;
    AppUser user = AppUser.fromDocument(doc!);
    branch = user.branch;
    sem = user.sem;
    section = user.section;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(branch);
    // print(section);
    // print(sem);

    return isLoading == true
        ? Scaffold(
            backgroundColor: Color.fromRGBO(29, 38, 40, 1),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            body: StreamBuilder<DocumentSnapshot?>(
              stream: widget.database?.assignmentStream(
                  branch: '$branch', sem: '$sem', section: '$section'),
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
                    title: Text('Assignment'),
                  ),
                  body: ListView.builder(
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
                          AssignmentTile(
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
            ),
          );
  }
}
