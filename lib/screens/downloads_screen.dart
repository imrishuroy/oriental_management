import 'package:flutter/material.dart';
import '../services/utility_functions.dart';

const List downloads = [
  {
    'title': 'Leave Application Form',
    'link':
        'https://github.com/imrishuroy/Images/raw/main/leave-application.pdf',
  },
  {
    'title': 'Shapath - Patra',
    'link': 'https://github.com/imrishuroy/Images/raw/main/shapath-patra.pdf'
  },
  {
    'title': 'Semester No Dues Form',
    'link':
        'https://github.com/imrishuroy/Images/raw/main/Semester%20No%20Dues%20Certificat(4)-1.pdf',
  },
  {
    'title': 'Anti-Ragging Affidavit for 3rd Sem Students',
    'link': 'https://github.com/imrishuroy/Images/raw/main/affidavit.pdf',
  },
];

class DownloadScreen extends StatelessWidget {
  static String routeName = '/downloads-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(29, 38, 40, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 141, 82, 1),
        centerTitle: true,
        title: Text('Downloads'),
        actions: [
          CircleAvatar(
            radius: 14.0,
            backgroundColor: Colors.white,
            child: Text(
              '${downloads.length}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 20.0),
        ],
      ),
      body: ListView.builder(
        itemCount: downloads.length,
        itemBuilder: (context, index) {
          return DownloadsTile(
            title: downloads[index]['title'],
            link: downloads[index]['link'],
          );
        },
      ),
    );
  }
}

class DownloadsTile extends StatelessWidget {
  final String? title;
  final String? link;

  const DownloadsTile({Key? key, this.title, this.link}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // UtilityFunctions utilityFunctions = UtilityFunctions();
    //final  utility = Utility;lity
    UtilityFunctions utility = UtilityFunctions();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
      child: Card(
        child: ListTile(
          contentPadding: EdgeInsets.all(10),
          title: Text(
            '$title',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          trailing: Padding(
            padding: const EdgeInsets.only(right: 3.0),
            child: ElevatedButton(
              onPressed: () => utility.launchInBrowser('$link'),
              child: Text(
                'Download',
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
    );
  }
}
