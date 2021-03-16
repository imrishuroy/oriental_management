import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:oriental_management/screens/add_profile_screen.dart';
import 'package:oriental_management/screens/edit_profile_screen.dart';
import 'package:oriental_management/services/database_service.dart';

class UserProfile extends StatelessWidget {
  final DataBase? database;

  UserProfile({Key? key, this.database}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: database?.profileDataSnapshot,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Some thing went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.data?.size == 0) {
          return Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddProfileScreen(database: database),
                  ),
                );
              },
              child: Text('Add Your Profile'),
            ),
          );
        }
        // QuerySnapshot? querySnapshot = snapshot.data;
        return ListView.builder(
          itemCount: snapshot.data?.size,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 27.0,
                vertical: 4.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.0),
                  // Row(
                  //   children: [
                  //     _profileDomainCard(
                  //         snapshot: snapshot, index: index, key: 'branch'),
                  //     _profileDomainCard(
                  //         snapshot: snapshot, index: index, key: 'sem'),
                  //     _profileDomainCard(
                  //         snapshot: snapshot, index: index, key: 'section'),
                  //   ],
                  // ),
                  SizedBox(height: 25.0),
                  _profileLabelText(label: 'Name'),
                  Text(
                    '${snapshot.data?.docs[index]['name']}',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 22.0),
                  _profileLabelText(label: 'Enrollment No'),
                  Text(
                    '${snapshot.data?.docs[index]['enrollNo']}',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 22.0),
                  _profileLabelText(label: 'Domain'),
                  Text(
                    '${snapshot.data?.docs[index]['branch']} ${snapshot.data?.docs[index]['sem']} sem ${snapshot.data?.docs[index]['section']}',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 22.0),
                  _profileLabelText(label: "Father's Name"),
                  Text(
                    '${snapshot.data?.docs[index]['father_name']}',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 22.0),
                  _profileLabelText(label: 'Mother\'s Name'),
                  Text(
                    '${snapshot.data?.docs[index]['mother_name']}',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 22.0),
                  _profileLabelText(label: 'Mobile Number'),
                  Text(
                    '${snapshot.data?.docs[index]['mobile_no']}',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 50.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfileScreen(
                            database: database,
                          ),
                        ),
                      ),
                      child: Text('Edit Your Profile'),
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _profileLabelText({String? label}) {
    return Column(
      children: [
        Text(
          '$label',
          style: TextStyle(
            fontSize: 16.0,
            // color: Color.fromRGBO(255, 203, 0, 1),
            color: Colors.white70,
            letterSpacing: 1.1,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 6.5),
      ],
    );
  }

  Widget _profileDomainCard({
    AsyncSnapshot<QuerySnapshot>? snapshot,
    int? index,
    String? key,
  }) {
    return Expanded(
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Text(
              '${snapshot?.data?.docs[index!]['$key']}',
              style: TextStyle(
                //color: Color.fromRGBO(255, 203, 0, 1),
                color: Color.fromRGBO(0, 141, 82, 1),
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:oriental_management/screens/add_profile_screen.dart';
// import 'package:oriental_management/screens/edit_profile_screen.dart';
// import 'package:oriental_management/services/database_service.dart';

// class UserProfile extends StatelessWidget {
//   final DataBase? database;

//   UserProfile({Key? key, this.database}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: database?.profileDataSnapshot,
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Text('Some thing went wrong');
//         }
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//         if (snapshot.data?.size == 0) {
//           return Center(
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => AddProfileScreen(database: database),
//                   ),
//                 );
//               },
//               child: Text('Add Your Profile'),
//             ),
//           );
//         }
//         // QuerySnapshot? querySnapshot = snapshot.data;
//         return ListView.builder(
//           itemCount: snapshot.data?.size,
//           itemBuilder: (context, index) {
//             return Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 27.0,
//                 vertical: 4.0,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 20.0),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       _profileDomainCard(
//                         snapshot: snapshot,
//                         index: index,
//                         key: 'branch',
//                       ),
//                       _profileDomainCard(
//                         snapshot: snapshot,
//                         index: index,
//                         key: 'sem',
//                       ),
//                       _profileDomainCard(
//                         snapshot: snapshot,
//                         index: index,
//                         key: 'section',
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 25.0),
//                   _profileLabelText(label: 'Name'),
//                   _profileOneContainer(
//                     snapshot: snapshot,
//                     index: index,
//                     key: 'name',
//                   ),
//                   SizedBox(height: 22.0),
//                   _profileLabelText(label: 'Enrollment No'),
//                   _profileOneContainer(
//                     snapshot: snapshot,
//                     index: index,
//                     key: 'enrollNo',
//                   ),
//                   SizedBox(height: 22.0),
//                   _profileLabelText(label: "Father's Name"),
//                   _profileOneContainer(
//                     snapshot: snapshot,
//                     index: index,
//                     key: 'father_name',
//                   ),
//                   SizedBox(height: 22.0),
//                   _profileLabelText(label: 'Mother\'s Name'),
//                   _profileOneContainer(
//                     snapshot: snapshot,
//                     index: index,
//                     key: 'mother_name',
//                   ),
//                   SizedBox(height: 22.0),
//                   _profileLabelText(label: 'Mobile Number'),
//                   _profileOneContainer(
//                     snapshot: snapshot,
//                     index: index,
//                     key: 'mobile_no',
//                   ),
//                   SizedBox(height: 25.0),
//                   Center(
//                     child: ElevatedButton(
//                       onPressed: () => Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => EditProfileScreen(
//                             database: database,
//                           ),
//                         ),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                         child: Text(
//                           'Edit Your Profile',
//                           style: TextStyle(fontSize: 17.0),
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }

//   Widget _profileDomainCard({
//     AsyncSnapshot<QuerySnapshot>? snapshot,
//     int? index,
//     String? key,
//   }) {
//     return Expanded(
//       child: Card(
//         color: Colors.white,
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Center(
//             child: Text(
//               '${snapshot?.data?.docs[index!]['$key']}',
//               style: TextStyle(
//                 //color: Color.fromRGBO(255, 203, 0, 1),
//                 color: Color.fromRGBO(0, 141, 82, 1),
//                 fontSize: 25.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Container _profileOneContainer(
//       {AsyncSnapshot<QuerySnapshot>? snapshot, int? index, String? key}) {
//     return Container(
//       height: 50.0,
//       width: 500.0,
//       decoration: BoxDecoration(
//         border: Border.all(
//           color: Color.fromRGBO(0, 141, 82, 1),
//           width: 2.5,
//         ),
//       ),
//       child: Center(
//         child: Text(
//           '${snapshot?.data?.docs[index!]['$key']}',
//           style: TextStyle(
//             fontSize: 18.0,
//             fontWeight: FontWeight.bold,
//             letterSpacing: 1.1,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _profileLabelText({String? label}) {
//     return Column(
//       children: [
//         Text(
//           '$label',
//           style: TextStyle(
//             fontSize: 15.5,
//             color: Color.fromRGBO(255, 203, 0, 1),
//             letterSpacing: 1.1,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(height: 6.5),
//       ],
//     );
//   }
// }
