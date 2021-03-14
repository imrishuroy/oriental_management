import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  final String? uid;
  final String? photUrl;
  final String? name;
  //final bool isVerified;
  final String? fatherName;
  final String? motherName;
  final String? mobileNo;
  final String? enrollNo;
  final String? branch;
  final String? sem;
  final int? attendance;
  final String? section;

  AppUser({
    required this.uid,
    this.photUrl,
    this.name,
    this.fatherName,
    this.motherName,
    this.mobileNo,
    this.enrollNo,
    this.branch,
    this.sem,
    this.attendance = 0,
    this.section,
    // this.isVerified,
  });

  // serializing our own object from firebase user class
  factory AppUser.fromDocument(DocumentSnapshot doc) {
    return AppUser(
      uid: doc['id'],
      photUrl: doc['image_url'],
      name: doc['name'],
      fatherName: doc['father_name'],
      motherName: doc['mother_name'],
      mobileNo: doc['mobile_no'],
      attendance: doc['attendance'],
      enrollNo: doc['enrollNo'],
      sem: doc['sem'],
      section: doc['section'],
      branch: doc['branch'],

      //  isVerified: doc['isVerified'],
    );
  }
}
