import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:oriental_management/services/database_service.dart';
import 'package:oriental_management/widgets/attendance_pie_chart.dart';
import 'package:oriental_management/widgets/subject_attendance_tile.dart';

class AttendanceScreen extends StatelessWidget {
  // final DataBase? database;

  static String routeName = '/attendance-screen';

  //AttendanceScreen({Key? key, this.database}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final DataBase? database =
        ModalRoute.of(context)?.settings.arguments as DataBase;
    return Scaffold(
      //backgroundColor: Color.fromRGBO(29, 38, 40, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 141, 82, 1),
        centerTitle: true,
        title: Text('Attendance - Rishu Kumar'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(15.0),
          child: Column(
            children: [
              Text(
                '0105CS191091',
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
      body: StreamBuilder<QuerySnapshot>(
        stream: database?.profileDataSnapshot,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Something went wrong'),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data?.size == 0) {
            return Center(
              child: Text('Nothing Here :)'),
            );
          }
          return ListView.builder(
            // itemCount: snapshot.data?.size,
            itemCount: snapshot.data?.size,
            itemBuilder: (context, index) {
              //   String attendance = '${snapshot.data?.docs[index]['attendance']}';
              //  return Center(child: Text('$attendance'));
              return Column(
                children: [
                  DisplayTotalAttendanceCard(),
                  SizedBox(height: 10.0),
                  Text('As on 13/03/2021'),
                  SizedBox(height: 120.0),
                  AttendancePieChart(),
                  SizedBox(height: 150),
                  SubjectAttendanceTile(
                    subCode: 'BT401',
                    subName: 'Mathematics- III',
                    facultyName: 'Manoj Sharma',
                    color: Colors.blue,
                  ),
                  SizedBox(height: 10.0),
                  SubjectAttendanceTile(
                    subCode: 'CS402',
                    subName: 'Analysis Design of Algorithm',
                    facultyName: 'Sreeja Nair',
                    color: const Color(0xfff8b250),
                  ),
                  SizedBox(height: 10.0),
                  SubjectAttendanceTile(
                    subCode: 'CS403',
                    subName: 'Software Engineering',
                    facultyName: 'Farrah Hannef',
                    color: const Color(0xff845bef),
                  ),
                  SizedBox(height: 10.0),
                  SubjectAttendanceTile(
                    subCode: 'CS404',
                    subName: 'COA',
                    facultyName: 'Meenakshi Patel',
                    color: const Color(0xff13d38e),
                  ),
                  SizedBox(height: 10.0),
                  SubjectAttendanceTile(
                    subCode: 'CS405',
                    subName: 'Operating Systems',
                    facultyName: 'Sanjiv Sharma',
                    color: Colors.red[200],
                  ),
                  SizedBox(height: 10.0),
                  SubjectAttendanceTile(
                    subCode: 'CS406',
                    subName: 'Programming Practices',
                    facultyName: 'Manoj Sharma',
                    color: Colors.purple,
                  ),
                  SizedBox(height: 10.0),
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                    label: Text(
                      'Report Error',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
