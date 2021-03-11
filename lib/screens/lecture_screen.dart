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
    // print(database?.id);
    return Scaffold(
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
                  style: TextStyle(fontSize: 20.0),
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
                BuildOneLeactureDay(
                  lectureList: monday?.length != 0 ? monday : defaultList,
                ),
                SizedBox(height: 20.0),
                BuildOneLeactureDay(
                  lectureList: tuesday?.length != 0 ? tuesday : defaultList,
                ),
                SizedBox(height: 20.0),
                BuildOneLeactureDay(
                  lectureList: wednesday?.length != 0 ? wednesday : defaultList,
                ),
                BuildOneLeactureDay(
                  lectureList: thursday,
                ),
                SizedBox(height: 20.0),
                BuildOneLeactureDay(
                  lectureList: friday?.length != 0 ? wednesday : defaultList,
                ),
                SizedBox(height: 20.0),
                BuildOneLeactureDay(
                  lectureList: saturday?.length != 0 ? saturday : defaultList,
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
