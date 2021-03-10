import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oriental_management/screens/attendance_screen.dart';
import 'package:oriental_management/screens/lecture_selection_screen.dart';
import 'package:oriental_management/services/database_service.dart';

import 'onecard.dart';

class DashBoardCards extends StatelessWidget {
  final DataBase? database;

  const DashBoardCards({Key? key, this.database}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.0),
          Expanded(
            child: GridView.count(
              childAspectRatio: 1.28,
              padding: EdgeInsets.symmetric(
                horizontal: 15.0,
              ),
              crossAxisCount: 2,
              children: [
                OneCard(
                  title: 'Announcements',
                  icon: FontAwesomeIcons.bell,
                  count: 11,
                ),
                OneCard(
                    title: 'Attendence',
                    icon: FontAwesomeIcons.calendarCheck,
                    count: 57,
                    onTap: () {
                      // MaterialPageRoute(
                      //   builder: (context) => AttendanceScreen(
                      //     database: database,
                      //   ),
                      // );
                      Navigator.pushNamed(context, AttendanceScreen.routeName,
                          arguments: database);
                    }),
                OneCard(
                  title: 'Assignments',
                  icon: FontAwesomeIcons.clipboardList,
                  count: 5,
                ),
                OneCard(
                  title: 'Lectures',
                  icon: FontAwesomeIcons.book,
                  count: 1,
                  onTap: () =>
                      Navigator.pushNamed(context, LectureSelection.routeName),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
