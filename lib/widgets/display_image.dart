import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:oriental_management/services/database_service.dart';

class DisplayImage extends StatelessWidget {
  final DataBase database;

  final usersRef = FirebaseFirestore.instance.collection('users');

  DisplayImage({Key key, this.database}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: database.userData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.data.length == 0) {
            return CircleAvatar(
              backgroundColor: Colors.white,
              radius: 60.0,
              child: SizedBox(
                height: 50.0,
                child: Image.asset(
                  'assets/avatar.png',
                  fit: BoxFit.cover,
                ),
              ),
            );
          } else {
            final imageUrl = snapshot.data[0]['image_url'] ?? null;
            return CircleAvatar(
              radius: 60.0,
              backgroundImage: NetworkImage(imageUrl),
            );
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
