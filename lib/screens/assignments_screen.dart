import 'package:flutter/material.dart';

class AssignmentScreen extends StatelessWidget {
  static String routeName = '/assignment-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(29, 38, 40, 1),
      appBar: AppBar(
        actions: [
          CircleAvatar(
            radius: 14.4,
            backgroundColor: Colors.grey,
            child: Text(
              '2',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(width: 20.0),
        ],
        centerTitle: true,
        backgroundColor: Color.fromRGBO(0, 141, 82, 1),
        title: Text('Assignment'),
      ),
      body: ListView(
        children: [
          SizedBox(height: 12.0),
          OneAssignmentTile(),
          SizedBox(height: 2.0),
          OneAssignmentTile(),
        ],
      ),
    );
  }
}

class OneAssignmentTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 5.0,
      ),
      child: Card(
        child: ListTile(
          contentPadding: EdgeInsets.all(0),
          leading: Container(
            color: Color.fromRGBO(255, 203, 0, 1),
            height: 60.0,
            width: 60.0,
            child: Center(
              child: Text(
                'CS-401',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          title: Text(
            'Mathemetics-3',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          subtitle: Text('Online Assignment - 1'),
          trailing: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Download',
                style: TextStyle(
                  fontSize: 12.0,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
