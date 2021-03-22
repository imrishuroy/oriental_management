import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const List downloads = [
  {
    'title': 'Anti-Ragging Affidavit for IIIrd Sem Students',
    'link': 'https://github.com/imrishuroy/Images/raw/main/affidavit.pdf',
  },
  {
    'title': 'Leave Application Form',
    'link':
        'https://github.com/imrishuroy/Images/raw/main/leave-application.pdf',
  },
  {
    'title': 'Shapath - Patra',
    'link': 'https://github.com/imrishuroy/Images/raw/main/shapath-patra.pdf'
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
      ),
      body: ListView.builder(
        itemCount: downloads.length,
        itemBuilder: (context, index) {
          return OneHappeningCard(
            title: downloads[index]['title'],
            link: downloads[index]['link'],
          );
        },
      ),
    );
  }
}

class OneHappeningCard extends StatelessWidget {
  final String? title;
  final String? link;

  const OneHappeningCard({Key? key, this.title, this.link}) : super(key: key);
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(),
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
            padding: const EdgeInsets.only(right: 10.0),
            child: ElevatedButton(
              onPressed: () => _launchInBrowser('$link'),
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
