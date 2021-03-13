import 'package:flutter/material.dart';
import 'package:oriental_management/screens/announcements_details_screen.dart';

const String subTitle =
    'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. It is also used to temporarily replace text in a process called greeking, which allows designers to consider the form of a webpage or publication, without the meaning of the text influencing the design.';

class AnnouncemetScreen extends StatelessWidget {
  static String routeName = '/announcement-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(29, 38, 40, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 141, 82, 1),
        centerTitle: true,
        title: Text('Announcements'),
      ),
      body: ListView(
        children: [
          SizedBox(height: 15.0),
          AnnouncementTile(),
          //sSizedBox(height: .0),
          AnnouncementTile(),
        ],
      ),
    );
  }
}

class AnnouncementTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
          child: Card(
            child: ListTile(
              onTap: () {
                //   Navigator.pushNamed(context, AnnouncementDetailScreen.routeName);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnnouncementDetailScreen(
                      appBarTitle: 'No More Online Classes',
                      contents: subTitle,
                    ),
                  ),
                );
              },
              contentPadding: EdgeInsets.all(10.0),
              title: Text(
                'No more online classes',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17.0),
              ),
              subtitle: Text('${subTitle.substring(0, 74)}...'),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.black,
                size: 30.0,
              ),
            ),
          ),
        ),
        Positioned(
          left: 12,
          top: 3,
          child: Container(
            color: Color.fromRGBO(255, 203, 0, 1),
            //color: Color.fromRGBO(29, 38, 40, 1),

            height: 21.0,
            width: 80.0,
            child: Center(
              child: Text(
                '12/03/21',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

// ExpansionTile(
//   title:
//   subtitle: Text('There is no more online classes from 15 March'),
//   // childrenPadding:
//     EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
// children: [
//   Text(
//     'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. It is also used to temporarily replace text in a process called greeking, which allows designers to consider the form of a webpage or publication, without the meaning of the text influencing the design.',
//   )
// ],
//  ),
