import 'package:flutter/material.dart';
import 'package:oriental_management/screens/happenings_details_screen.dart';

const List happenings = [
  {
    'imageUrl':
        'https://i.pinimg.com/originals/ca/76/0b/ca760b70976b52578da88e06973af542.jpg',
    'title': 'Solution Challenge DSC OIST',
    'description': 'Solution challenge is one the awesome events of dsc',
  },
  {
    'imageUrl': 'https://static.toiimg.com/photo/72975551.cms',
    'title': 'Exam is over!',
    'description': 'Let\'s go to home and enjoy our vacations',
  },
  {
    'imageUrl':
        'https://s35691.pcdn.co/wp-content/uploads/2020/06/7-things-that-worked.jpg',
    'title': '4th sem classed from monday',
    // 'subTitle': 'For ofline classed bring your negative corna test',

    'description':
        'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. It is also used to temporarily replace text in a process called greeking, which allows designers to consider the form of a webpage or publication, without the meaning of the text influencing the design',
  },
];

class HappeningScreen extends StatelessWidget {
  static String routeName = '/happening-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(29, 38, 40, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 141, 82, 1),
        centerTitle: true,
        title: Text('Happenings'),
        actions: [
          CircleAvatar(
            radius: 14.0,
            backgroundColor: Colors.white,
            child: Text(
              '3',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 20.0),
        ],
      ),
      body: ListView.builder(
        itemCount: happenings.length,
        itemBuilder: (context, index) {
          return OneHappeningCard(
            imageUrl: happenings[index]['imageUrl'],
            tilte: happenings[index]['title'],
            description: happenings[index]['description'],
          );
        },
      ),
    );
  }
}

class OneHappeningCard extends StatelessWidget {
  final String? imageUrl;
  final String? tilte;
  final String? description;

  const OneHappeningCard(
      {Key? key, this.imageUrl, this.tilte, this.description})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 9.0,
        right: 9.0,
        top: 3.0,
      ),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HappeningDetailScreen(
              imageUrl: imageUrl,
              title: tilte,
              description: description,
            ),
          ),
        ),
        child: Card(
          elevation: 8.0,
          child: ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            leading: Container(
              height: 100.0,
              width: 100.0,
              child: Image.network(
                imageUrl!,
                fit: BoxFit.fill,
              ),
            ),
            title: Text(
              '$tilte',
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: description!.length >= 30
                ? Text('${description?.substring(0, 30)}...')
                : Text('$description'),
          ),
        ),
      ),
    );
  }
}
