import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DataBase {
  Future<void> setData({
    String name,
    String fatherName,
    String motherName,
    String mobileNo,
    File image,
    String documentId,
  });
  Stream userData();
  String get id;
  // getDoc();
  // documentExist();
  Future<List> getDocument();
}

class FireStoreDataBase implements DataBase {
  final String uid;

  FireStoreDataBase({this.uid});
  @override
  String get id => uid;

  // @override
  // getDoc() async {
  //   final QuerySnapshot result = await FirebaseFirestore.instance
  //       .collection('users')
  //       .where('id', isEqualTo: uid)
  //       .get();
  //   final List<DocumentSnapshot> documents = result.docs;
  //   //   return documents.length;
  //   return result.docs.length;
  // }

  // @override
  // documentExist() async {
  //   bool exist;
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(uid)
  //       .collection('userData')
  //       .get()
  //       .then((value) {
  //     if (value.size == 0) {
  //       print('Document does not exist');
  //       //return false;
  //       exist = false;
  //     } else {
  //       print('documents  exist');
  //       //   return true;
  //       exist = true;
  //     }
  //   });

  //     .then((DocumentSnapshot documentSnapshot) {
  //   if (documentSnapshot.exists) {
  //     print('document exist');
  //   } else {
  //     print('document does not exist');
  //   }
  // },

  // );
  //   return exist;
  // }
  @override
  Future<List> getDocument() async {
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('users')
        .where('id', isEqualTo: uid)
        .get();
    final List<DocumentSnapshot> documents = result.docs;
    return documents;
  }

  @override
  Future<void> setData({
    String name,
    String fatherName,
    String motherName,
    String mobileNo,
    File image,
    String documentId,
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
    await ref.putFile(image);
    final imageUrl = await ref.getDownloadURL();

    await reference.set(
      {
        'name': name,
        'image_url': imageUrl,
        'father_name': fatherName,
        'mother_name': motherName,
        'mobile_no': mobileNo,
        'id': uid,
      },
    );
  }

  @override
  Stream userData() {
    final reference =
        // FirebaseFirestore.instance.collection('users/$uid/userData');
        FirebaseFirestore.instance
            .collection('users')
            .where('id', isEqualTo: uid);
    //   final reference = FirebaseFirestore.instance.collection('users/');
    if (reference.snapshots() != null) {
      final snapshot = reference.snapshots();

      return snapshot.map((snapshot) => snapshot.docs);
    } else {
      return null;
    }
  }

  // return snapshot;
}

// Future<void> uploadData(File image) async {
//   final firebaseStorage = FirebaseStorage.instance;
//   try {
//     final ref = firebaseStorage.ref().child('user_image').child('$uid.jpg');
//     await ref.putFile(image);
//     final imageUrl = await ref.getDownloadURL();
//     await
//   } catch (error) {}
// }

// _uploadImage(File image) async {
//   final ref = FirebaseStorage.instance
//       .ref()
//       .child('user_image')
//       .child('${auth.currentUser.uid}' + '.jpg');

//   await ref.putFile(image);

//   final imageUrl = await ref.getDownloadURL();
//   await FirebaseFirestore.instance
//       .collection('userImages')
//       .doc(auth.currentUser.uid)
//       .set({
//     'email': auth.currentUser.email,
//     'image_url': imageUrl,
//   });
// }
