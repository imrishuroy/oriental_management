import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

abstract class Utility {
  Future<void> launchInBrowser(String url);
  void showSnackBar({BuildContext? context});
}

class UtilityFunctions implements Utility {
  @override
  Future<void> launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  void showSnackBar({BuildContext? context}) {
    ScaffoldMessenger.of(context!).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          'No file available',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
            letterSpacing: 1.0,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
