import 'package:flutter/material.dart';

class AnnouncementDetailScreen extends StatelessWidget {
  static String routeName = '/announcement-detail-screen';
  final String? title;
  final String? message;

  const AnnouncementDetailScreen({
    Key? key,
    this.title,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(29, 38, 40, 1),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(0, 141, 82, 1),
        title: Text('Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.0),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Text(
                '$title',
                style: TextStyle(
                  fontSize: 22.0,
                  letterSpacing: 1.1,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(255, 203, 0, 1),
                ),
              ),
            ),
            Padding(
              padding:
                  // const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  const EdgeInsets.only(top: 10.0, left: 20.0, right: 14.0),
              child: Text(
                message!,
                style: TextStyle(
                  fontFamily: 'NotoSerif',
                  color: Colors.white,
                  fontSize: 18.0,
                  letterSpacing: 1.0,
                ),
              ),
            ),
            SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }
}
