import 'package:flutter/material.dart';

class BuildOneLeactureDay extends StatelessWidget {
  // final String? day;
  // final String? lectureDate;
  final List? lectureList;

  const BuildOneLeactureDay({
    Key? key,
    // this.day,
    // this.lectureDate,
    this.lectureList,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final String? day = '${lectureList?[0]['day']}';
    final String? date = '${lectureList?[0]['date']}';
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.symmetric(horizontal: 23.0),
          child: Row(
            children: [
              Text(
                '$day',
                style: TextStyle(fontSize: 25.0),
                textAlign: TextAlign.start,
              ),
              SizedBox(width: 4.0),
              Text(
                '$date',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 10.0),
        SizedBox(
          height: 130,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: lectureList?.length,
            itemBuilder: (context, index) {
              return OneLeactureCard(
                time: '${lectureList?[index]['time']}',
                profName: lectureList?[index]['profName'],
                subCode: lectureList?[index]['subCode'],
                subName: lectureList?[index]['subName'],
              );
            },
          ),
        ),
      ],
      // ),
    );
  }
}

class OneLeactureCard extends StatelessWidget {
  final String? time;
  final String? subCode;
  final String? profName;
  final String? subName;

  const OneLeactureCard({
    Key? key,
    this.time,
    this.subCode,
    this.profName,
    this.subName,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 4.0,
              ),
              color: Color.fromRGBO(0, 141, 82, 1),
              child: Text(
                '$time',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Text('$subCode', style: TextStyle(fontSize: 16.0)),
            SizedBox(height: 5.0),
            Text(
              subName!,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              '$profName',
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.1,
              ),
            )
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class BuildOneLeactureDay extends StatelessWidget {
//   final String? day;
//   final String? lectureDate;
//   final List? lectureList;

//   const BuildOneLeactureDay({
//     Key? key,
//     this.day,
//     this.lectureDate,
//     this.lectureList,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           alignment: Alignment.topLeft,
//           padding: const EdgeInsets.symmetric(horizontal: 23.0),
//           child: Row(
//             children: [
//               Text(
//                 '$day',
//                 style: TextStyle(fontSize: 25.0),
//                 textAlign: TextAlign.start,
//               ),
//               SizedBox(width: 4.0),
//               Text(
//                 '08/12',
//                 style: TextStyle(
//                   fontWeight: FontWeight.w600,
//                 ),
//               )
//             ],
//           ),
//         ),
//         SizedBox(height: 10.0),
//         SizedBox(
//           height: 120,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: lectureList?.length,
//             itemBuilder: (context, index) {
//               return OneLeactureCard(
//                 time: '${lectureList?[index]['time']}',
//                 profName: lectureList?[index]['profName'],
//                 subCode: lectureList?[index]['subCode'],
//                 subName: lectureList?[index]['subName'],
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }

// class OneLeactureCard extends StatelessWidget {
//   final String? time;
//   final String? subCode;
//   final String? profName;
//   final String? subName;

//   const OneLeactureCard({
//     Key? key,
//     this.time,
//     this.subCode,
//     this.profName,
//     this.subName,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
//         child: Column(
//           children: [
//             Container(
//               padding: EdgeInsets.symmetric(
//                 horizontal: 8.0,
//                 vertical: 4.0,
//               ),
//               color: Color.fromRGBO(0, 141, 82, 1),
//               child: Text(
//                 time!,
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             SizedBox(height: 8.0),
//             Text('$subCode', style: TextStyle(fontSize: 16.0)),
//             Text(
//               subName!,
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 4.0),
//             Text(
//               '$profName',
//               style: TextStyle(
//                 color: Colors.orange,
//                 fontWeight: FontWeight.w600,
//                 letterSpacing: 1.1,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
