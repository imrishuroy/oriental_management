import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:oriental_management/services/database_service.dart';

class AttendanceScreen extends StatelessWidget {
  // final DataBase? database;

  static String routeName = '/attendance-screen';

  //AttendanceScreen({Key? key, this.database}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final DataBase? database =
        ModalRoute.of(context)?.settings.arguments as DataBase;
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance'),
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
              String attendance = '${snapshot.data?.docs[index]['attendance']}';
              return Center(child: Text('$attendance'));
            },
          );
        },
      ),
    );
  }
}
