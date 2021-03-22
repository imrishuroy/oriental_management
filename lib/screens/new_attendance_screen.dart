import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:oriental_management/models/attendance_model.dart';

class NewAttendanceScreen extends StatefulWidget {
  static String routeName = '/new-attendance-screen';

  @override
  _NewAttendanceScreenState createState() => _NewAttendanceScreenState();
}

class _NewAttendanceScreenState extends State<NewAttendanceScreen> {
  bool _isLoading = false;

  List<AttendanceModel> attendance = <AttendanceModel>[];
  String name = '';
  int totalAttendance = 0;

  bool isLoading = false;
  @override
  void initState() {
    getAttendance();
    super.initState();
  }

  void getAttendance() async {
    setState(() {
      _isLoading = true;
    });
    var url = Uri.parse(
        'https://script.googleusercontent.com/macros/echo?user_content_key=GvKePxnqFJPGmaTyJrBpB5ZEqAtrjiTdtItM8aCGnVzEQnHeol56eFGyBknh3AmDHFQKA9mjOoiUz_5QhqqOrzXSC0LUEgh0m5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnH7kNMPB_xI-sxmd5fsqjni0oxa_V7KpRqiocJFUu1ioj5H50oFFJvyk95RtJ_SLTubbocl4HaIn6Prd4blkmqAXSLoOc5Duqg&lib=MsvI444TSp283wZTVBAU2SnImAf41yL87');
    var response = await http.get(url);
    // print(response.body);
    var jsonFeedback = convert.jsonDecode(response.body);
    // print(jsonFeedback);

    // // serializin the json response according to our class
    // feedbacks = jsonFeedback.map((json) => FeedBackModel.fromJson(json));
    // print(feedbacks);

    jsonFeedback.forEach((element) {
      AttendanceModel attendanceModel = AttendanceModel();
      attendanceModel.name = element['name'];
      attendanceModel.enrollNo = element['enrollment_no'];
      attendanceModel.totalAttendance = element['total_attendance'];
      attendance.add(attendanceModel);
    });
    // attendance.removeLast();

    // print(feedbacks[0].name);
    AttendanceModel currentUser =
        attendance.firstWhere((element) => element.enrollNo == '0105CS191091');
    //print(attendance[0].name);
    setState(() {
      name = currentUser.name!;
      totalAttendance = currentUser.totalAttendance!;
    });
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance Screen'),
      ),
      body: _isLoading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              child: Center(
                child: Column(
                  children: [
                    Text('$name'),
                    Text('$totalAttendance'),
                  ],
                ),
              ),
            ),
    );
  }
}
