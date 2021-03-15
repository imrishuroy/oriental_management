import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oriental_management/screens/announcements_screen.dart';
import 'package:oriental_management/screens/assignments_screen.dart';
import 'package:oriental_management/screens/attendance_screen.dart';
import 'package:oriental_management/screens/lecture_selection_screen.dart';

import 'package:oriental_management/services/database_service.dart';
import 'package:provider/provider.dart';

import 'onecard.dart';

class DashBoardCards extends StatelessWidget {
  // final DataBase? database;

  // const DashBoardCards({Key? key, this.database}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final DataBase database = Provider.of<DataBase>(context);
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
                  onTap: () {
                    Navigator.pushNamed(context, AnnouncemetScreen.routeName);
                  },
                ),
                OneCard(
                  title: 'Attendence',
                  icon: FontAwesomeIcons.calendarCheck,
                  count: 57,
                  onTap: () {
                    Navigator.pushNamed(context, AttendanceScreen.routeName,
                        arguments: database);
                  },
                ),
                OneCard(
                  title: 'Assignments',
                  icon: FontAwesomeIcons.clipboardList,
                  count: 5,
                  onTap: () {
                    //By using StateFull Widget

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => NewAssignmentScreen(
                    //       database: database,
                    //     ),
                    //   ),
                    // );

                    // By using Future Builder and Stateless Widget
                    Navigator.pushNamed(context, AssignmentScreen.routeName,
                        arguments: database);
                  },
                ),
                OneCard(
                  title: 'Lectures',
                  icon: FontAwesomeIcons.book,
                  count: 1,
                  onTap: () => Navigator.pushNamed(
                    context,
                    LectureSelection.routeName,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
