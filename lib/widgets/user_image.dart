// import 'package:flutter/material.dart';
// import 'package:oriental_management/services/database_service.dart';

// class UserImage extends StatelessWidget {
//   final DataBase dataBase;

//   const UserImage({Key key, this.dataBase}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     // final data = Provider.of<DataBase>(context, listen: false);
//     if (dataBase.userData() != null) {
//       return StreamBuilder(
//         stream: dataBase.userData(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Center(
//               child: CircleAvatar(
//                 radius: 60,
//                 backgroundColor: Colors.white,
//                 child: Icon(
//                   Icons.image,
//                   size: 40.0,
//                 ),
//               ),
//             );
//           } else {
//             if (snapshot.connectionState == ConnectionState.active) {
//               final image = snapshot.data[0]['image_url'] ?? null;
//               return CircleAvatar(
//                 radius: 60,
//                 backgroundColor: Colors.white,
//                 backgroundImage: image != null ? NetworkImage(image) : null,
//                 child: image == null ? Icon(Icons.camera) : null,
//               );
//             } else {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           }
//         },
//       );
//     } else {
//       return CircleAvatar(
//         radius: 60,
//         backgroundColor: Colors.white,
//         child: Icon(
//           Icons.image,
//           size: 40.0,
//         ),
//       );
//     }
//   }
// }

// // class UserImage extends StatelessWidget {
// //   final DataBase dataBase;

// //   const UserImage({Key key, this.dataBase}) : super(key: key);
// //   @override
// //   Widget build(BuildContext context) {
// //     // final data = Provider.of<DataBase>(context, listen: false);

// //     return StreamBuilder(
// //       stream: dataBase.userData(),
// //       builder: (context, snapshot) {
// //         if (snapshot.hasData) {
// //           return ListView.builder(
// //             itemCount: snapshot.data.length,
// //             itemBuilder: (context, index) {
// //               final image = snapshot.data[index]['image_url'] ?? null;
// //               return CircleAvatar(
// //                 radius: 60,
// //                 backgroundColor: Colors.white,
// //                 backgroundImage: image != null ? NetworkImage(image) : null,
// //                 child: image == null ? Icon(Icons.camera) : null,
// //               );
// //             },
// //           );
// //         } else {
// //           return CircleAvatar(
// //             radius: 60,
// //             backgroundColor: Colors.white,
// //             child: Icon(
// //               Icons.image,
// //               size: 40.0,
// //             ),
// //           );
// //         }
// //       },
// //     );
// //   }
// // }
