import 'package:flutter/material.dart';
import 'package:oriental_management/screens/lecture_screen.dart';

enum Section { a, b }

class LectureSelection extends StatefulWidget {
  static String routeName = '/lecture-selction';

  @override
  _LectureSelectionState createState() => _LectureSelectionState();
}

class _LectureSelectionState extends State<LectureSelection> {
  String branchValue = 'CS';
  String semValue = '2nd';
  Section? _section = Section.a;

  List itemsList = <String>['One', 'Two', 'Free', 'Four'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Lectures'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 3.0,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'Please select your Domain',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      child: DropdownButton<String>(
                        value: branchValue,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            branchValue = newValue!;
                            //   print(branchValue);
                          });
                        },
                        items: <String>['CS', 'IT', 'ECE', 'CIVIL']
                            .map<DropdownMenuItem<String>>(
                          (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      child: DropdownButton<String>(
                        value: semValue,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            semValue = newValue!;
                            //  print(semValue);
                          });
                        },
                        items: <String>['2nd', '4th', '6th', '8th']
                            .map<DropdownMenuItem<String>>(
                          (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                    ListTile(
                      title: Text('Section-A'),
                      leading: Radio(
                        value: Section.a,
                        groupValue: _section,
                        onChanged: (Section? value) {
                          setState(() {
                            _section = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('Section-B'),
                      leading: Radio(
                        value: Section.b,
                        groupValue: _section,
                        onChanged: (Section? value) {
                          setState(() {
                            _section = value;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // print(branchValue);
              // print(semValue);
              // if (_section == Section.a) {
              //   print('A');
              // } else {
              //   print('B');
              // }
              // print(_section);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => LectureScreen(
                    branch: branchValue,
                    section: _section == Section.a ? 'A' : 'B',
                    sem: semValue,
                  ),
                ),
              );
            },
            child: Text('Submit'),
          )
        ],
      ),
    );
  }
}
