import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:oriental_management/models/app_user.dart';
import 'package:oriental_management/models/attendance_model.dart';
import 'package:oriental_management/services/database_service.dart';
import 'package:oriental_management/widgets/attendance_data.dart';

import 'package:oriental_management/widgets/nothing_here.dart';

const String sub2 =
    'https://script.googleusercontent.com/macros/echo?user_content_key=urKvPTjwsKX1Dujj4vZZbC3s95MhBmdFQk87Vt6z925BK-wRdJe6bbR8HnVibBgxHV7c84HcCKYq0p6D2jfGCSGeHxuZUVWcm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnEQIJ2mnmIN47oM7_9CQr2AKksxq_sUBKgNiJNzIt2cQBaqIGBhL57rUT5_30YrglypLcg99tK78XcsW_xDRPujlomHsk4zbSNz9Jw9Md8uu&lib=MF1IRVQUPyWVqLuWo5ZKf7wMz0pnu8441';

class NewAttendanceScreen extends StatelessWidget {
  static String routeName = '/new-attendance-screen';

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
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              final Map? data = attendanceSnapshot.data?.data();
              //  final List? attendanceList = data?['attendance'];
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
              return AttendanceData(
                name: user.name,
                enrollNo: user.enrollNo,
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
