import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:oriental_management/models/app_user.dart';
import 'package:oriental_management/services/database_service.dart';

import 'package:oriental_management/widgets/nothing_here.dart';
import 'package:oriental_management/widgets/pie_chart.dart';
import 'package:oriental_management/widgets/students_attendance_tile_old.dart';
import 'package:oriental_management/widgets/subject_attendance_tile.dart';

const List<Color> color = [
  Color(0xff845bef),
  Color(0xff0293ee),
  Color(0xfff8b400),
  Color(0xff13d38e),
  Color(0xffd2e603),
];

class AttendanceScreen extends StatelessWidget {
  static String routeName = '/attendance-screen';

  @override
  Widget build(BuildContext context) {
    final DataBase? database =
        ModalRoute.of(context)?.settings.arguments as DataBase;

    return FutureBuilder<DocumentSnapshot?>(
      future: database?.currentUserData,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return NothingHere(
            appBarTitle: 'Attendance',
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: Color.fromRGBO(29, 38, 40, 1),
            body: Center(
              child: CircularProgressIndicator(),
            ),
            // body: Image.asset('assets/loader.gif'),
          );
        }

        if (snapshot.data?.exists == true) {
          // checks weather user has added their profile
          AppUser user = AppUser.fromDocument(snapshot.data!);

          return StreamBuilder<DocumentSnapshot?>(
            stream: database?.attendaceStream(
              branch: user.branch,
              sem: user.sem,
              enrollNo: user.enrollNo,
            ),
            builder: (BuildContext context, attendanceSnapshot) {
              if (attendanceSnapshot.connectionState ==
                  ConnectionState.waiting) {
                return Scaffold(
                  backgroundColor: Color.fromRGBO(29, 38, 40, 1),
                  body:
                      // Center(
                      //   child: Container(
                      //     height: 80.0,
                      //     width: 70.0,
                      //     child: Image.asset('assets/loader.gif'),
                      //   ),
                      // ),
                      Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              final Map? data = attendanceSnapshot.data?.data();
              final List? attendanceList = data?['attendance'];
              final totalAttendance = data?['totalAttendance'];
              final lastUpdated = data?['lastUpdated'];
              // print(attendance);
              final int? lenghtOfAttendance =
                  attendanceSnapshot.data?.data()?['attendance']?.length;
              //  print('Assignment Length $lenghtOfAttendance');
              if (lenghtOfAttendance == null ||
                  lenghtOfAttendance == 0 ||
                  totalAttendance == null ||
                  lastUpdated == '') {
                return NothingHere(
                  appBarTitle: 'Attendance',
                );
              }
              return Scaffold(
                backgroundColor: Color.fromRGBO(29, 38, 40, 1),
                appBar: AppBar(
                  backgroundColor: Color.fromRGBO(0, 141, 82, 1),
                  centerTitle: true,
                  title: Text('Attendance - ${user.name}'),
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(15.0),
                    child: Column(
                      children: [
                        Text(
                          '${user.enrollNo}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                        SizedBox(height: 15.0)
                      ],
                    ),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 15.0),
                      DisplayTotalAttendanceCard(
                        totalAttendance: data?['totalAttendance'],
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'As on ${data?['lastUpdated']}',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 120.0),
                      //  AttendancePieChart(attendanceList: attendanceList),
                      AttendancePieChartOld(attendanceList: attendanceList),
                      SizedBox(height: 150),
                      SizedBox(
                        height: 400,
                        child: ListView.builder(
                          itemCount: attendanceList?.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                SubjectAttendanceTileOld(
                                  subCode:
                                      '${attendanceList?[index]['subCode']}',
                                  subName:
                                      '${attendanceList?[index]['subName']}',
                                  facultyName:
                                      '${attendanceList?[index]['faculty']}',
                                  color: color[index],
                                ),
                                SizedBox(height: 10.0),
                              ],
                            );
                          },
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.error, color: Colors.red),
                        label: Text(
                          'Report Error',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }
        return NothingHere(
          appBarTitle: 'Attendance',
        );
      },
    );
  }
}
