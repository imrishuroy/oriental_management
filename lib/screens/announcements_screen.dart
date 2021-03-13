import 'package:flutter/material.dart';
import 'package:oriental_management/screens/announcement_details_screen.dart';

class AnnouncemetScreen extends StatelessWidget {
  static String routeName = '/announcement-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 141, 82, 1),
        centerTitle: true,
        title: Text('Announcements'),
      ),
      body: ListView(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AnnouncementDetailsScreen.routeName);
            },
            child: Card(
              child: ExpansionTile(
                title: Text(
                  'No more online classes',
                ),
                subtitle: Text('There is no more online classes from 15 March'),
                // childrenPadding:
                //     EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                // children: [
                //   Text(
                //     'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. It is also used to temporarily replace text in a process called greeking, which allows designers to consider the form of a webpage or publication, without the meaning of the text influencing the design.',
                //   )
                // ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
