# oriental_management

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



<!-- 
SHA1: 00:E8:ED:51:5F:9F:E4:32:8D:21:D7:C8:59:7E:67:D6:5E:64:02:4B
SHA256: E8:FC:2D:7B:6D:AE:4F:D1:F9:F5:A3:25:DF:20:E0:29:2B:A6:0F:5E:81:C1:78:02:30:73:B4:2F:9D:DF:28:EF -->


<!-- 

//  final String? day = data?.map((key, value) => value);

// final String? day = data?['monday'][index]['day'] ?? 'Error';
// //return Center(child: Text('${data?.map((key, value) => prin(value))}'));
// final String? monday =
//     '${data?['lectures']['monday'][index]['subName']}';
// final String? tuesday =
//     '${data?['lectures']['tuesday'][index]['subName']}';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class NewLectureScreen extends StatelessWidget {
//   final String? branch;
//   final String? sem;
//   final String? section;

//   NewLectureScreen({
//     Key? key,
//     this.branch,
//     this.sem,
//     this.section,
//   }) : super(key: key);

//   final CollectionReference lectures =
//       FirebaseFirestore.instance.collection('lecturesCollection');

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('$branch-$sem Sem ($section)'),
//       ),
//       body: FutureBuilder<DocumentSnapshot>(
//         future: lectures.doc('CS').get(),
//         builder:
//             (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return Text('Something went wrong');
//           }

//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           } else {
//             Map? data = snapshot.data?.data();
//             return ListView.builder(
//               itemCount: data?.length,
//               itemBuilder: (context, index) {
//                 final String? day = data?['monday'][index]['day'] ?? 'Error';
//                 return Center(child: Text('$day'));
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// } -->


<!-- 
  Widget build(BuildContext context) {
    return Provider<Example>(
      create: (_) => Example(),
      // Will throw a ProviderNotFoundError, because `context` is associated
      // to the widget that is the parent of `Provider<Example>`
      child: Text(context.watch<Example>()),
    ),
  }
  ```

  consider using `builder` like so:

  ```
  Widget build(BuildContext context) {
    return Provider<Example>(
      create: (_) => Example(),
      // we use `builder` to obtain a new `BuildContext` that has access to the provider
      builder: (context) {
        // No longer throws
        return Text(context.watch<Example>()),
      }
    ),
  }
  ```
 -->

<!-- 
 TextField(
                    decoration: InputDecoration(
                      labelText: 'EMAIL',
                      labelStyle: TextStyle(
                        //fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'PASSWORD',
                      labelStyle: TextStyle(
                        //  fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green,
                        ),
                      ),
                    ),
                    obscureText: true,
                  ), -->


<!-- Production Keys - 

Certificate fingerprints:
         SHA1: 1C:6B:4D:86:13:50:AE:F6:A2:80:18:F6:3E:B9:3E:31:3C:08:A2:EC
         SHA256: B7:F9:3E:07:6D:04:4C:7E:07:8B:71:1F:FC:33:F0:A0:29:48:8A:F6:44:8F:B7:D2:D4:1A:F0:6D:56:1B:6D:FF -->