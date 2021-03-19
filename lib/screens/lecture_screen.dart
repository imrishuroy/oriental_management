import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:oriental_management/services/app_database_service.dart';
import 'package:oriental_management/widgets/leactures_card.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    final AppDataBase database =
        Provider.of<AppDataBase>(context, listen: false);

    return Scaffold(
      backgroundColor: Color.fromRGBO(29, 38, 40, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 141, 82, 1),
        centerTitle: true,
        title: Text('$branch - $sem Sem ($section)'),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: database.getLecturesData(
            branch: branch, sem: sem, section: section),
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
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              );
            }
            final List? monday = data?['Monday'];
            final List? tuesday = data?['Tuesday'];
            final List? wednesday = data?['Wednesday'];
            final List? thursday = data?['Thursday'];
            final List? friday = data?['Friday'];
            final List? saturday = data?['Saturday'];

            //  Text('${data?['Thursday']}'),
            return ListView(
              children: [
                SizedBox(height: 20.0),
                monday == null
                    ? BuildOneLeactureDay(
                        lectureList: defaultList,
                        day: 'Monday',
                      )
                    : BuildOneLeactureDay(
                        lectureList: monday.length != 0 ? monday : defaultList,
                        day: 'Monday',
                      ),
                SizedBox(height: 20.0),
                tuesday == null
                    ? BuildOneLeactureDay(
                        lectureList: defaultList,
                        day: 'Tuesday',
                      )
                    : BuildOneLeactureDay(
                        lectureList:
                            tuesday.length != 0 ? tuesday : defaultList,
                        day: 'Tuesday',
                      ),
                SizedBox(height: 20.0),
                wednesday == null
                    ? BuildOneLeactureDay(
                        lectureList: defaultList,
                        day: 'Wednesday',
                      )
                    : BuildOneLeactureDay(
                        lectureList:
                            wednesday.length != 0 ? wednesday : defaultList,
                        day: 'Wednesday',
                      ),
                SizedBox(height: 20.0),
                thursday == null
                    ? BuildOneLeactureDay(
                        lectureList: defaultList,
                        day: 'Thursday',
                      )
                    : BuildOneLeactureDay(
                        lectureList:
                            thursday.length != 0 ? thursday : defaultList,
                        day: 'Thursday',
                      ),
                SizedBox(height: 20.0),
                friday == null
                    ? BuildOneLeactureDay(
                        lectureList: defaultList,
                        day: 'Friday',
                      )
                    : BuildOneLeactureDay(
                        lectureList: friday.length != 0 ? friday : defaultList,
                        day: 'Friday',
                      ),
                SizedBox(height: 20.0),
                saturday == null
                    ? BuildOneLeactureDay(
                        lectureList: defaultList,
                        day: 'Saturday',
                      )
                    : BuildOneLeactureDay(
                        lectureList:
                            saturday.length != 0 ? saturday : defaultList,
                        day: 'Saturday',
                      ),
              ],
            );
          }
        },
      ),
    );
  }
}
