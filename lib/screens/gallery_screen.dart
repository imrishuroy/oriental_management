import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:oriental_management/data/quotes_data.dart';
import 'package:oriental_management/services/app_database_service.dart';
import 'package:oriental_management/widgets/image_carousel.dart';

import 'package:provider/provider.dart';
import "dart:math";

class GalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _random = Random();

    // generate a random index based on the list length
// and use it to retrieve the element
    var quote = quotes[_random.nextInt(quotes.length)];

    final AppDataBase database =
        Provider.of<AppDataBase>(context, listen: false);
    return Scaffold(
      backgroundColor: Color.fromRGBO(29, 38, 40, 1),
      //  backgroundColor: Color.fromRGBO(29, 38, 40, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 141, 82, 1),
        centerTitle: true,
        title: Text('Gallery'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: database.galleryStream(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Some thing went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          // important
          // QuerySnapshot? querySnapshot = snapshot.data;

          return Column(
            children: [
              SizedBox(height: 18.0),
              ImageCarousel(),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      '${quote['quote']}',
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 8.0,
                      ),
                      child: Text(
                        '${quote['author']}',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 203, 0, 1),
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                          letterSpacing: 1.1,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(10.0),
                  itemCount: snapshot.data?.docs.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    final imageUrl = snapshot.data?.docs[index]['imageUrl'];
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          '$imageUrl',
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

// Padding(
//   padding: const EdgeInsets.symmetric(
//     horizontal: 20.0,
//     vertical: 10.0,
//   ),
//   child: TextField(
//     decoration: InputDecoration(
//       fillColor: Colors.white24,
//       filled: true,
//       hintText: 'What are you looking for?',
//       suffixIcon: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10.0),
//         child: IconButton(
//           icon: Icon(
//             Icons.search,
//             color: Colors.green,
//             size: 40.0,
//           ),
//           onPressed: () {},
//         ),
//       ),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//     ),
//   ),
// ),
// //  SizedBox(height: 5.0),
// Padding(
//   padding: const EdgeInsets.all(8.0),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     children: [
//       OneGalleryCard(
//         color: Color(0xffffa45b),
//         label: 'Campus',
//         icon: Icons.apartment,
//       ),
//       OneGalleryCard(
//         color: Color(0xff65d6ce),
//         label: 'Cantein',
//         icon: Icons.food_bank,
//       ),
//       OneGalleryCard(
//         color: Color(0xffb6eb7a),
//         label: 'Classes',
//         icon: Icons.group_sharp,
//       ),
//     ],
//   ),
// ),
// Padding(
//   padding: const EdgeInsets.all(8.0),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     children: [
//       OneGalleryCard(
//         color: Color(0xffffb0cd),
//         label: 'Lab',
//       ),
//       OneGalleryCard(
//         color: Color(
//           0xffed6663,
//         ),
//         icon: Icons.workspaces_outline,
//         label: 'Workspaces',
//       ),
//       OneGalleryCard(
//         color: Color(0xff5edfff),
//         icon: Icons.more_vert,
//         label: 'More',
//       ),
//     ],
//   ),
// ),
