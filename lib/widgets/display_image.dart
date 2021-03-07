import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:oriental_management/services/database_service.dart';

class DisplayImage extends StatelessWidget {
  final DataBase? database;

  DisplayImage({Key? key, this.database}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: database?.profileDataSnapshot,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Something went wrong'));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.data?.size == 0) {
          return CircleAvatar(
            radius: 55.0,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.image,
              color: Colors.green,
            ),
          );
        }
        String? imageUrl = '${snapshot.data?.docs[0]['image_url']}';
        return CircleAvatar(
          radius: 55.0,
          backgroundColor: Colors.white,
          backgroundImage: NetworkImage(imageUrl),
        );
      },
    );
  }
}
