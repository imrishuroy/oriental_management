import 'package:flutter/material.dart';
import 'package:oriental_management/services/database_service.dart';

import 'package:oriental_management/widgets/app_drawer.dart';
import 'package:oriental_management/widgets/dashboards_cards.dart';
import 'package:oriental_management/widgets/todays_lectures.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DataBase database = Provider.of<DataBase>(context, listen: false);
    return Scaffold(
      drawer: AppDrawer(),
      backgroundColor: Color.fromRGBO(29, 38, 40, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 141, 82, 1),
        centerTitle: true,
        title: Text('DashBoard'),
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
          DashBoardCards(),
          TodaysLectures(
            database: database,
          ),
        ],
      ),
    );
  }
}
