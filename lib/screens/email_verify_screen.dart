import 'package:flutter/material.dart';

class EmailVerifyScreen extends StatelessWidget {
  // User user;

  // @override
  // void initState() {
  //   user = auth.currentUser;
  //   user.sendEmailVerification();
  //   timer = Timer.periodic(Duration(seconds: 5), (timer) {
  //     chekEmailVerified();
  //   });
  //   super.initState();
  // // }

  // Future chekEmailVerified() async {
  //   user = auth.currentUser;
  //   await user.reload();

  //   if (user.emailVerified) {
  //     timer.cancel();
  //     Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(
  //         builder: (context) => HomeScreen(),
  //       ),
  //     );
  //   }
  // }

  // @override
  // void dispose() {
  //   timer.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Email Verification'),
      ),
      body: Center(
        child: Text('Please verify your email'),
      ),
    );
  }
}
