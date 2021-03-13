import 'package:flutter/material.dart';

class AnnouncementDetailScreen extends StatelessWidget {
  static String routeName = '/announcement-detail-screen';
  final String? appBarTitle;
  final String? contents;

  const AnnouncementDetailScreen({
    Key? key,
    this.appBarTitle,
    this.contents,
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
      body: Column(
        children: [
          Text(contents!),
        ],
      ),
    );
  }
}
