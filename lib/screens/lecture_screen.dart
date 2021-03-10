import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:oriental_management/widgets/leactures_card.dart';

const List defaultList = [
  {
    'day': 'Not-available',
    'date': '(**)',
    'time': '():--??-??:--()',
    'subCode': '----',
    'profName': '---------',
    'subName': '--'
  },
];

class LectureScreen extends StatelessWidget {
  final String? branch;
  final String? sem;
  final String? section;

  LectureScreen({
    Key? key,
    this.branch,
    this.sem,
    this.section,
  }) : super(key: key);

  final CollectionReference lectures =
      FirebaseFirestore.instance.collection('lecturesCollection');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('$branch-$sem Sem ($section)'),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        //   future: lectures.doc('CS').collection('2nd').doc('B').get(),
        future:
            lectures.doc('$branch').collection('$sem').doc('$section').get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            Map? data = snapshot.data?.data();
            if (data?.length == 0) {
              return Center(
                child: Text(
                  'Nothing Here :)',
                  style: TextStyle(fontSize: 20.0),
                ),
              );
            }
            return ListView.builder(
              itemCount: data?.length,
              itemBuilder: (context, index) {
                final List? monday = data?['lectures']['monday'];
                final List? tuesday = data?['lectures']['tuesday'];
                final List? wednesday = data?['lectures']['wednesday'];
                final List? thrusday = data?['lectures']['thrusday'];
                final List? friday = data?['lectures']['friday'];
                final List? saturday = data?['lectures']['saturday'];

                return Column(
                  children: [
                    SizedBox(height: 20.0),
                    BuildOneLeactureDay(
                      lectureList: monday?.length != 0 ? monday : defaultList,
                    ),
                    SizedBox(height: 20.0),
                    BuildOneLeactureDay(
                      lectureList: tuesday?.length != 0 ? tuesday : defaultList,
                    ),
                    SizedBox(height: 20.0),
                    BuildOneLeactureDay(
                      lectureList:
                          friday?.length != 0 ? wednesday : defaultList,
                    ),
                    SizedBox(height: 20.0),
                    BuildOneLeactureDay(
                      lectureList:
                          wednesday?.length != 0 ? thrusday : defaultList,
                    ),
                    SizedBox(height: 20.0),
                    BuildOneLeactureDay(
                      lectureList: friday?.length != 0 ? friday : defaultList,
                    ),
                    SizedBox(height: 20.0),
                    BuildOneLeactureDay(
                      lectureList: friday?.length != 0 ? saturday : defaultList,
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}

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
// }
