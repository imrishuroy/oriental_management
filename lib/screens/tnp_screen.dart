import 'package:flutter/material.dart';
import 'package:oriental_management/services/utility_functions.dart';

const List upcomingdrives = [
  {
    'title': 'Tech Mahindra Off Campus Freshers Drive',
    'link': 'https://registration.techmahindra.com/Candidate/RegDefault.aspx',
    'date': '25/03/2021',
    'lastdate': 'Last date to apply is 29/03/2021',
  },
  {
    'title': 'BYJUs Off Campus Freshers Drive',
    'link': 'https://s.ripplehire.com/s/Cig7',
    'date': '25/03/2021',
    'lastdate': 'Last date to apply is 29/03/2021',
  },
  {
    'title': 'Hexaware Technologies Off Campus Freshers Drive',
    'link': 'https://www.firstnaukri.com/job/HIB',
    'date': '24/03/2021',
    'lastdate': 'Last date to apply is 28/03/2021',
  },
  {
    'title': 'Deloitte Off Campus Freshers Drive',
    'link': 'https://jobs2.deloitte.com/ui/en/job/E21HUANAAP-ETLQA-CAN',
    'date': '22/03/2021',
    'lastdate': 'Last date to apply is 27/03/2021',
  },
];

class TnpScreen extends StatelessWidget {
  static String routeName = '/tnp-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(29, 38, 40, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 141, 82, 1),
        centerTitle: true,
        title: Text('Training and Placement'),
        actions: [
          CircleAvatar(
            radius: 14.0,
            backgroundColor: Colors.white,
            child: Text(
              '${upcomingdrives.length}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 20.0),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: Text(
              'On Going Placement drives :',
              style: TextStyle(
                fontSize: 20.0,
                color: Color.fromRGBO(255, 203, 0, 1),
                letterSpacing: 1.2,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            height: 400.0,
            child: ListView.builder(
              itemCount: upcomingdrives.length,
              itemBuilder: (context, index) {
                return UpcomingDrives(
                  title: upcomingdrives[index]['title'],
                  link: upcomingdrives[index]['link'],
                  date: upcomingdrives[index]['date'],
                  lastdate: upcomingdrives[index]['lastdate'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class UpcomingDrives extends StatelessWidget {
  final String? title;
  final String? link;
  final String? date;
  final String? lastdate;

  const UpcomingDrives(
      {Key? key, this.title, this.link, this.date, this.lastdate})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    UtilityFunctions utility = UtilityFunctions();
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
          child: Card(
            child: ListTile(
              contentPadding: EdgeInsets.all(10),
              title: Text(
                '$title',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              subtitle: Text('$lastdate'),
              trailing: Padding(
                padding: const EdgeInsets.only(right: 3.0),
                child: ElevatedButton(
                  onPressed: () => utility.launchInBrowser('$link'),
                  child: Text(
                    'Apply',
                    style: TextStyle(
                      fontSize: 12.5,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          // right: 12,
          left: 12,
          top: 3,
          child: Container(
            color: Color.fromRGBO(255, 203, 0, 1),
            //color: Color.fromRGBO(29, 38, 40, 1),

            height: 21.0,
            width: 80.0,
            child: Center(
              child: Text(
                '$date',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        )
      ],
    );
  }
}
