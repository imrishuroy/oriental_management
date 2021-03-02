// import 'package:flutter/material.dart';
// import 'package:oriental_app/screens/register_screen.dart';

// class AuthScreen extends StatefulWidget {
//   @override
//   _AuthScreenState createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: Container(
//               alignment: Alignment.center,
//               height: 200.0,
//               width: 200.0,
//               child: Image.network(
//                   'https://i.pinimg.com/originals/8a/ef/c1/8aefc13be28515f1342a4a1e90feb37b.png'),
//             ),
//           ),
//           SizedBox(height: 8.0),
//           GestureDetector(
//             onTap: () {
//               Navigator.of(context).pushNamed(RegisterScreen.routeName);
//             },
//             child: Card(
//               color: Colors.blue,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(
//                     horizontal: 40.0, vertical: 12.0),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Icon(Icons.mail, color: Colors.white),
//                     SizedBox(width: 10.0),
//                     Text(
//                       'Sigin With Email',
//                       style: TextStyle(
//                         fontSize: 18.0,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// // StreamBuilder(
// //       stream: FirebaseAuth.instance.authStateChanges(),
// //       builder: (ctx, snapshot) {
// //         if (snapshot.hasData) {
// //           return SuccusScreen();
// //         } else {
// //           return RegisterScreen();
// //         }
// //       },
// //     );
