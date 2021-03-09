import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:oriental_management/widgets/leactures_card.dart';

class LeactureScreeen extends StatelessWidget {
  static String routeName = '/lectues-screeen';
  final CollectionReference lectures =
      FirebaseFirestore.instance.collection('lectures');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 141, 82, 1),
        centerTitle: true,
        title: Text('Lectures'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: lectures.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data?.size,
            itemBuilder: (context, index) {
              // final String? day = '${snapshot.data?.docs[index]['day']}';
              // final String? date = '${snapshot.data?.docs[index]['date']}';
              final List? monday = snapshot.data?.docs[index]['monday'];
              final List? tuesday = snapshot.data?.docs[index]['tuesday'];
              final List? wednessday = snapshot.data?.docs[index]['Wednesday'];
              return Column(
                children: [
                  SizedBox(height: 20.0),
                  BuildOneLeactureDay(
                    // day: 'Monday',
                    // lectureDate: '08/03',
                    lectureList: monday ?? [],
                  ),
                  SizedBox(height: 20.0),
                  BuildOneLeactureDay(
                    // day: 'Tuesday',
                    // lectureDate: '09/03',
                    lectureList: tuesday ?? [],
                  ),
                  SizedBox(height: 20.0),
                  BuildOneLeactureDay(
                    // day: 'Tuesday',
                    // lectureDate: '09/03',
                    lectureList: wednessday ?? [],
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
