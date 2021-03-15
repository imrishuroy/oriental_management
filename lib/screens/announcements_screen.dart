import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:oriental_management/services/app_database_service.dart';

import 'package:oriental_management/widgets/announcement_tile.dart';
import 'package:oriental_management/widgets/nothing_here.dart';
import 'package:provider/provider.dart';

class AnnouncemetScreen extends StatelessWidget {
  static String routeName = '/announcement-screen';

  @override
  Widget build(BuildContext context) {
    final appDataBase = Provider.of<AppDataBase>(context, listen: false);
    return StreamBuilder<DocumentSnapshot?>(
      stream: appDataBase.announcementStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return NothingHere();
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: Color.fromRGBO(29, 38, 40, 1),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        final int? announcementLength =
            snapshot.data?.data()?['announcements'].length;
        return Scaffold(
          backgroundColor: Color.fromRGBO(29, 38, 40, 1),
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(0, 141, 82, 1),
            centerTitle: true,
            title: Text('Announcements'),
            actions: [
              CircleAvatar(
                radius: 13.5,
                backgroundColor: Colors.black45,
                child: Text('$announcementLength'),
              ),
              SizedBox(width: 20.0),
            ],
          ),
          body: ListView.builder(
            itemCount: announcementLength,
            itemBuilder: (context, index) {
              final String? date =
                  snapshot.data?.data()?['announcements'][index]['date'];
              final String? title =
                  snapshot.data?.data()?['announcements'][index]['title'];
              final String? message =
                  snapshot.data?.data()?['announcements'][index]['message'];
              return Column(
                children: [
                  SizedBox(height: 15.0),
                  AnnouncementTile(
                    date: '$date',
                    title: '$title',
                    message: '$message',
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
