import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:oriental_management/models/attendance_model.dart';

const List<Color> color = [
  Color(0xff845bef),
  Color(0xff0293ee),
  Color(0xfff8b400),
  Color(0xff13d38e),
  Color(0xffd2e603),
];

class AttendancePieChart extends StatefulWidget {
  final List<AttendanceModel?>? attendanceList;
  final List<Map>? subjects;

  const AttendancePieChart({
    Key? key,
    this.attendanceList,
    this.subjects,
  }) : super(key: key);
  @override
  _AttendancePieChartState createState() => _AttendancePieChartState();
}

class _AttendancePieChartState extends State<AttendancePieChart> {
  int? touchedIndex = 0;

  // List<PieChartSectionData> showSections(int touchIndex) {
  //   //return PieData.data
  //   return widget.attendanceList!
  //       .asMap()
  //       .map<int, PieChartSectionData>((index, data) {
  //         final isTouched = index == touchIndex;
  //         final double fontSize = isTouched ? 25 : 16;
  //         final double radius = isTouched ? 60 : 50;
  //         final value = PieChartSectionData(
  //           // color: data.color,
  //           color: color[index],
  //           // value: data.percent,
  //           value: (widget.attendanceList?[index]['attendance']).toDouble(),
  //           // value: 10.0,
  //           radius: radius,
  //           // title: '${data.percent}%',
  //           title: '${widget.attendanceList?[index]['attendance']}%',
  //           titleStyle: TextStyle(
  //             fontSize: fontSize,
  //             fontWeight: FontWeight.bold,
  //             color: Color(0xffffffff),
  //           ),
  //         );
  //         return MapEntry(index, value);
  //       })
  //       .values
  //       .toList();
  // }
  List<PieChartSectionData> showSections(int touchIndex) {
    //return PieData.data
    return widget.attendanceList!
        .asMap()
        .map<int, PieChartSectionData>((index, data) {
          final isTouched = index == touchIndex;
          final double fontSize = isTouched ? 25 : 16;
          final double radius = isTouched ? 60 : 50;
          var attendance = ((widget.attendanceList![index]!.totalAttendance! /
                      widget.subjects?[index]['totalClass']) *
                  100)
              .round();

          final value = PieChartSectionData(
            // color: data.color,
            color: color[index],
            // value: data.percent,
            value: (widget.attendanceList?[index]?.totalAttendance)?.toDouble(),
            // value: 10.0,
            radius: radius,
            // title: '${data.percent}%',
            // title: '${(widget.attendanceList?[index]?.totalAttendance / widget.subjects?[index]['totalClass']  ) * 100)?.round()}%',
            title: '$attendance%',
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Color(0xffffffff),
            ),
          );
          return MapEntry(index, value);
        })
        .values
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    //print(widget.attendanceList);
    List<int> allAttendance = [];
    List<int> newList = [];

    for (var item in widget.attendanceList!) {
      allAttendance.add(item!.totalAttendance!);
      newList.add(item.totalAttendance!);
    }
    print('All Attendance $allAttendance');
    //  newList = allAttendance;
    print('New List $newList');
    newList.sort();
    // allAttendance.sort();
    // print(allAttendance.last);
    print('All List $allAttendance');

    print('New List $newList');
    print(allAttendance.indexOf(newList.last));
    int reqData = allAttendance.indexOf(newList.last);
    //  print(allAttendance);

    return PieChart(
      PieChartData(
        pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
          // setState(() {
          // setState(() {
          //   touchedIndex = reqData;
          // });

          //   touchedIndex = newList.last;
          // });
          setState(() {
            if (pieTouchResponse.touchInput is FlLongPressEnd ||
                pieTouchResponse.touchInput is FlPanEnd) {
              touchedIndex = reqData;
            } else {
              // touchedIndex = pieTouchResponse.touchedSectionIndex;
              touchedIndex = reqData;
            }
          });
        }),
        borderData: FlBorderData(
          show: false,
        ),
        sectionsSpace: 0,
        //  centerSpaceRadius: 40,
        centerSpaceRadius: 50,
        sections: showSections(reqData),
      ),
    );
  }
}

// List<PieChartSectionData> showingSections(int touchIndex) {
//   return List.generate(
//     5,
//     (i) {
//       final isTouched = i == touchedIndex;
//       final double fontSize = isTouched ? 25 : 16;
//       final double radius = isTouched ? 60 : 50;
//       switch (i) {
//         case 0:
//           return PieChartSectionData(
//             color: const Color(0xff0293ee),
//             value: 40,
//             title: '40%',
//             radius: radius,
//             titleStyle: TextStyle(
//                 fontSize: fontSize,
//                 fontWeight: FontWeight.bold,
//                 color: const Color(0xffffffff)),
//           );
//         case 1:
//           return PieChartSectionData(
//             color: const Color(0xfff8b250),
//             value: 30,
//             title: '30%',
//             radius: radius,
//             titleStyle: TextStyle(
//                 fontSize: fontSize,
//                 fontWeight: FontWeight.bold,
//                 color: const Color(0xffffffff)),
//           );
//         case 2:
//           return PieChartSectionData(
//             color: const Color(0xff845bef),
//             value: 15,
//             title: '10%',
//             radius: radius,
//             titleStyle: TextStyle(
//                 fontSize: fontSize,
//                 fontWeight: FontWeight.bold,
//                 color: const Color(0xffffffff)),
//           );
//         case 3:
//           return PieChartSectionData(
//             color: const Color(0xff13d38e),
//             value: 15,
//             title: '10%',
//             radius: radius,
//             titleStyle: TextStyle(
//                 fontSize: fontSize,
//                 fontWeight: FontWeight.bold,
//                 color: const Color(0xffffffff)),
//           );
//         case 4:
//           return PieChartSectionData(
//             color: Colors.red[200],
//             value: 15,
//             title: '10%',
//             radius: radius,
//             titleStyle: TextStyle(
//                 fontSize: fontSize,
//                 fontWeight: FontWeight.bold,
//                 color: const Color(0xffffffff)),
//           );
//         default:
//           return PieChartSectionData();
//       }
//     },
//   );
// }
