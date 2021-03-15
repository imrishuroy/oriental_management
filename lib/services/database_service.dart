import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class DataBase {
  Future<void> setData({
    String? name,
    String? enrollNo,
    String? section,
    String? sem,
    String? fatherName,
    String? motherName,
    String? mobileNo,
    File? image,
    int? attendance,
  });

  String? get id;
  Stream<QuerySnapshot> get profileDataSnapshot;
  Future<DocumentSnapshot?> get currentUserData;
  Stream<DocumentSnapshot?> assignmentStream({
    String? branch,
    String? sem,
    String? section,
  });
}

class FireStoreDataBase implements DataBase {
  final usersRef = FirebaseFirestore.instance.collection('users');
  final CollectionReference assignmentsRef =
      FirebaseFirestore.instance.collection('assignments');

  final String? uid;

  FireStoreDataBase({this.uid});

  @override
  String? get id => uid;

  @override
  Future<DocumentSnapshot?> get currentUserData async {
    return await usersRef.doc(uid).get();
  }

  @override
  Future<void> setData(
      {String? name,
      String? enrollNo,
      String? sem,
      String? fatherName,
      String? motherName,
      String? mobileNo,
      File? image,
      String? section,
      int? attendance
      //String? documentId,
      // adding new documents
      }) async {
    final firebaseStorage = FirebaseStorage.instance;
    final reference =
        //   FirebaseFirestore.instance.doc('users/$uid/userData/$documentId/');
        // FirebaseFirestore.instance.doc('users/$uid/userData/$uid/');

        // adding new path
        FirebaseFirestore.instance.doc('users/$uid');
    // new data
    //  FirebaseFirestore.instance.doc('users/$uid/');
    final ref = firebaseStorage.ref().child('user_image').child('$uid.jpg');
    await ref.putFile(image!);
    final imageUrl = await ref.getDownloadURL();

    await reference.set(
      {
        'name': name,
        'enrollNo': enrollNo,
        'sem': sem,
        'section': section,
        'image_url': imageUrl,
        'father_name': fatherName,
        'mother_name': motherName,
        'mobile_no': mobileNo,
        'id': uid,
        'attendance': 0
      },
    );
  }

  @override
  Stream<QuerySnapshot> get profileDataSnapshot {
    return FirebaseFirestore.instance
        .collection('users')
        .where('id', isEqualTo: uid)
        .snapshots();
  }

  @override
  Stream<DocumentSnapshot?> assignmentStream({
    String? branch,
    String? sem,
    String? section,
  }) {
    return assignmentsRef.doc(branch).collection(sem!).doc(section).snapshots();
  }
}
