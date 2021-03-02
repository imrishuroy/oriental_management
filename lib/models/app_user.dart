import 'package:flutter/foundation.dart';

class AppUser {
  final String uid;
  final String photUrl;
  final String name;
  final bool isVerified;

  AppUser({
    @required this.uid,
    this.photUrl,
    this.name,
    this.isVerified,
  });
}
