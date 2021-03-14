import 'package:flutter/material.dart';

class OneAssignmentTile extends StatelessWidget {
  final String? subCode;
  final String? subName;
  final String? assignmentName;
  final String? downloadLink;

  const OneAssignmentTile({
    Key? key,
    this.subCode,
    this.subName,
    this.assignmentName,
    this.downloadLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 5.0,
      ),
      child: Card(
        child: ListTile(
          contentPadding: EdgeInsets.all(0),
          leading: Container(
            color: Color.fromRGBO(255, 203, 0, 1),
            height: 60.0,
            width: 60.0,
            child: Center(
              child: Text(
                '${subCode?.toUpperCase()}',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          title: Text(
            '$subName',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          subtitle: Text('$assignmentName'),
          trailing: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Download',
                style: TextStyle(
                  fontSize: 12.5,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
