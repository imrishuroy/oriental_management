import 'package:flutter/material.dart';
import 'package:oriental_management/attendance/sub_one_attendance.dart';
import 'package:oriental_management/attendance/sub_three_attendance.dart';
import 'package:oriental_management/attendance/sub_two_attendance.dart';
import 'package:oriental_management/attendance/subject_five_attendance.dart';
import 'package:oriental_management/attendance/subject_four_attendance.dart';

class AttendanceScreen3 extends StatelessWidget {
  static String routeName = 'attendance-screen3';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(29, 38, 40, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 141, 82, 1),
        centerTitle: true,
        title: Text('Attendance'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10.0),
            SubjectOne(),
            SizedBox(height: 120.0),
            SizedBox(
              width: 100.0,
              child: Divider(
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 20.0),
            SubjectTwoAttendance(),
            SizedBox(height: 120.0),
            SizedBox(
              width: 100.0,
              child: Divider(
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 20.0),
            SubjectThreeAttendance(),
            SizedBox(height: 120.0),
            SizedBox(
              width: 100.0,
              child: Divider(
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 20.0),
            SubjectFourAttendance(),
            SizedBox(height: 120.0),
            SizedBox(
              width: 100.0,
              child: Divider(
                color: Colors.white70,
              ),
            ),
            SubjectFiveAttendance(),
            SizedBox(height: 120.0),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:oriental_management/attendance/sub_one_attendace.dart';
// import 'package:oriental_management/attendance/sub_three_attendance.dart';
// import 'package:oriental_management/attendance/sub_two_attendance.dart';
// import 'package:oriental_management/models/attendance_model.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert' as convert;

// import 'package:oriental_management/services/utility_functions.dart';

// class AttendanceScreen3 extends StatefulWidget {
//   static String routeName = 'attendance-screen3';

//   @override
//   _AttendanceScreen3State createState() => _AttendanceScreen3State();
// }

// class _AttendanceScreen3State extends State<AttendanceScreen3> {
//   bool _isLoading = false;
//   int? totalAttendane = 0;

//   List<AttendanceModel> attendance = <AttendanceModel>[];

//   // List<AttendanceModel> sub5 = <AttendanceModel>[];
//   List<AttendanceModel> allSubjects = <AttendanceModel>[];
//   // List subjectsName = [];
//   List<Map> subjects = [];
//   int totalClass = 0;
//   int totalClassAttended = 0;

//   bool _sub2Loading = false;
//   String sub2Name = '';
//   int totalClassedHeld = 0;
//   int sub2totalClassAttended = 0;
//   int sub2totalAttendane = 0;
//   // @override
//   // void initState() {
//   //   getAttendance();
//   //   super.initState();
//   // }

//   // void getSub2Attendance() async {
//   //   setState(() {
//   //     _sub2Loading = true;
//   //   });

//   //   var url = Uri.parse(
//   //       'https://script.googleusercontent.com/macros/echo?user_content_key=kcXleL4SElggrYik2RIg81y0mlJz0Rxj12RlywCrvroMHlYnCydKj2i6Bl2D2ItzxVNulFJJBPEe93OrST4anzxgHcVKBviTm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnJCEyGutd5rIS1s8kI1wPPlLtGZuAHqUH8pu6TAD50rc7kZFjPdIbd-6v1UQAZ2hb9DQOKXDWWUbSmpNx2BGQtEs2lSl6vDkjNz9Jw9Md8uu&lib=MF1IRVQUPyWVqLuWo5ZKf7wMz0pnu8441');
//   //   var response = await http.get(url);
//   //   List jsonFeedback = convert.jsonDecode(response.body);
//   //   sub2Name = jsonFeedback[0]['sn_no'];
//   //   totalClassedHeld = jsonFeedback[0]['total_attendance'];
//   //   jsonFeedback.removeAt(0);
//   //   jsonFeedback.forEach((element) {
//   //     AttendanceModel attendanceModel = AttendanceModel();
//   //     if (element['enrollment_no'] == '0105CS191091') {
//   //       attendanceModel.name = element['name'];
//   //       attendanceModel.enrollNo = element['enrollment_no'];
//   //       attendanceModel.totalAttendance = element['total_attendance'];

//   //       // allSubjects.add(attendanceModel);
//   //       sub2totalClassAttended = attendanceModel.totalAttendance!;
//   //     }
//   //   });
//   //   setState(() {
//   //     _sub2Loading = false;
//   //   });
//   // }

//   void getAttendance() async {
//     setState(() {
//       _isLoading = true;
//     });

//     // for (int i = 0; i < subjectsAPI.length; i++) {
//     var url = Uri.parse(
//         'https://script.googleusercontent.com/macros/echo?user_content_key=K-JOKEYMaT3CBGN96R-LICOPvw9DEsjN_f0XnvjK4bWkYWwhyqBMZHRnXMLdBKNs4Z93mbbRQc6K5K8ng7lhGShzAJ1OTfF8m5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnNqPB0FYNLhMs1KWNbZ-gsRWg1mKBLfieC0Ohzq2yZeki9jvd8q0mbvLoWrpo_94u2Llx1kRc6yK82y2RcVQURyTpttntIGOmw&lib=McpbRyBfCpUY4eZ2FK9GBG3ImAf41yL87');

//     var response = await http.get(url);
//     //  print(response.body);
//     List jsonFeedback = convert.jsonDecode(response.body);
//     // subjectsName.add(jsonFeedback[0]['sn_no']);
//     // subjects list is giving us all the subjects of user
//     subjects.add(
//       {
//         'name': jsonFeedback[0]['sn_no'],
//         'totalClass': jsonFeedback[0]['total_attendance'],
//       },
//     );

//     // print(jsonFeedback);
//     jsonFeedback.forEach((element) {
//       AttendanceModel attendanceModel = AttendanceModel();
//       if (element['enrollment_no'] == '0105CS191091') {
//         attendanceModel.name = element['name'];
//         attendanceModel.enrollNo = element['enrollment_no'];
//         attendanceModel.totalAttendance = element['total_attendance'];

//         allSubjects.add(attendanceModel);
//       }
//     });

//     setState(() {
//       _isLoading = false;
//     });
//     //getSub2Attendance();
//   }

//   @override
//   Widget build(BuildContext context) {
//     for (int i = 0; i < allSubjects.length; i++) {
//       print(allSubjects[i].totalAttendance);
//     }
//     //  totalClass += subjects[i]['totalClass'] as int;
//     //   totalClassAttended += allSubjects[i].totalAttendance!;
//     if (allSubjects.isEmpty || subjects[0]['totalClass'] == null) {
//       totalAttendane = 0;
//     } else {
//       totalAttendane =
//           ((allSubjects[0].totalAttendance! / subjects[0]['totalClass']) * 100)
//               .round();
//     }
//     if (allSubjects.isEmpty) {
//       sub2totalAttendane = 0;
//     } else {
//       sub2totalAttendane =
//           ((sub2totalAttendane / totalClassedHeld) * 100).round();
//     }

//     print(totalAttendane);

//     return Scaffold(
//       backgroundColor: Color.fromRGBO(29, 38, 40, 1),
//       appBar: AppBar(
//         backgroundColor: Color.fromRGBO(0, 141, 82, 1),
//         centerTitle: true,
//         // actions: [
//         //   TextButton(
//         //     onPressed: () => getAttendance(),
//         //     child: Text(
//         //       'Get',
//         //       style: TextStyle(
//         //         color: Colors.white,
//         //         fontSize: 20.0,
//         //       ),
//         //     ),
//         //   ),
//         //   SizedBox(width: 10.0),
//         // ],
//         title: Text('Attendance'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(height: 10.0),
//             SubjectOne(),
//             SizedBox(height: 120.0),
//             SizedBox(
//               width: 100.0,
//               child: Divider(
//                 color: Colors.white70,
//               ),
//             ),
//             SizedBox(height: 10.0),
//             SubjectTwoAttendance(),
//             SizedBox(height: 120.0),
//             SizedBox(
//               width: 100.0,
//               child: Divider(
//                 color: Colors.white70,
//               ),
//             ),
//             SizedBox(height: 10.0),
//             SubjectThreeAttendance()
//           ],
//         ),
//       ),
//     );
//   }
// }
