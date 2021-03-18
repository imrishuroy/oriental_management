import 'package:flutter/material.dart';
import 'package:oriental_management/services/auth_service.dart';
import 'package:oriental_management/services/database_service.dart';
import 'package:oriental_management/widgets/display_image.dart';
import 'package:oriental_management/widgets/user_profile.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = '/profile-screen';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String documentId() => DateTime.now().toIso8601String();

  //final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<DataBase>(context, listen: false);
    final auth = Provider.of<AuthServices>(context, listen: false);

    return Scaffold(
      backgroundColor: Color.fromRGBO(29, 38, 40, 1),
      appBar: AppBar(
        actions: [
          TextButton.icon(
            onPressed: () => auth.signOutUser(),
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            label: Text(
              'Logout',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17.5,
              ),
            ),
          ),
          SizedBox(width: 10.0),
        ],
        centerTitle: true,
        title: Text('Your Profile'),
        backgroundColor: Color.fromRGBO(0, 141, 82, 1),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(150.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisSize: MainAxisSize.max,
            children: [
              DisplayImage(database: database),
              SizedBox(height: 25.0),
            ],
          ),
        ),
      ),
      body: UserProfile(
        database: database,
      ),
    );
  }
}
