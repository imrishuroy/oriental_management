import 'package:flutter/material.dart';
import 'package:oriental_management/widgets/about_us_cards.dart';

class AboutUsScreen extends StatelessWidget {
  static String routeName = '/about-us-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(29, 38, 40, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 141, 82, 1),
        centerTitle: true,
        title: Text('About Us'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Text(
                'We are a group of individuals who are passionate about community work and believe technology can solve many day to day problems.\n',
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: Color.fromRGBO(255, 203, 0, 1),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AboutUsCards(
                  name: 'Rishu Roy',
                  designation: 'Flutter Developer',
                  imageUrl: 'assets/rishu.jpg',
                  instaUrl: 'https://www.instagram.com/imrishuroy/',
                  linkdInUrl: 'https://www.linkedin.com/in/imrishuroy/',
                ),
                AboutUsCards(
                  name: 'Pranav Chaturvedi',
                  designation: 'Flutter Developer',
                  imageUrl: 'assets/pranav.jpeg',
                  linkdInUrl:
                      'https://www.linkedin.com/in/pranav-chaturvedi99/',
                  instaUrl: 'https://www.instagram.com/framesxpc/',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AboutUsCards(
                  name: 'Abhas Asati',
                  designation: 'Flutter Developer',
                  imageUrl: 'assets/abhas.png',
                  linkdInUrl: 'https://www.linkedin.com/in/abhasasati/',
                  instaUrl: 'https://www.instagram.com/abhas_asati/',
                ),
                AboutUsCards(
                  name: 'Nishant',
                  designation: 'Flutter Developer',
                  imageUrl: 'assets/nishant.jpeg',
                  linkdInUrl:
                      'https://www.linkedin.com/in/nishant-kumar-4aa1591b3',
                  instaUrl: 'https://www.instagram.com/__niks_1/',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
