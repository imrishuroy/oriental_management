import 'package:flutter/material.dart';
import 'package:oriental_management/services/database_service.dart';
import 'package:oriental_management/widgets/app_drawer.dart';
import 'package:oriental_management/widgets/dashboards_cards.dart';
import 'package:oriental_management/widgets/todays_lectures.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<DataBase>(context);
    return Scaffold(
      drawer: AppDrawer(),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Color.fromRGBO(255, 203, 0, 1),
      //   onPressed: () {},
      // ),

      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // main-color -
      backgroundColor: Color.fromRGBO(29, 38, 40, 1),
      //acent-color - backgroundColor: Color.fromRGBO(0, 141, 82, 1),
      //text-color - backgroundColor: Color.fromRGBO(255, 255, 250, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 141, 82, 1),
        centerTitle: true,
        title: Text('DashBoard'),
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.notes,
        //   ),
        //   onPressed: () => Scaffold.of(context).openDrawer(),
        // ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.message,
            ),
            onPressed: () {},
          ),
          SizedBox(width: 7.0),
        ],
      ),
      body: Column(
        children: [
          DashBoardCards(database: database),
          TodaysLectures(),
        ],
      ),
    );
  }
}
