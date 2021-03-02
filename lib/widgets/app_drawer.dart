import 'package:flutter/material.dart';
import 'package:oriental_management/services/auth_service.dart';
import 'package:oriental_management/services/database_service.dart';
import 'package:oriental_management/widgets/display_image.dart';

import 'package:provider/provider.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthServices>(context, listen: false);
    final database = Provider.of<DataBase>(context);
    return StreamBuilder(
      stream: database.userData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.data.length == 0) {
            return Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Container(
                    height: 250.0,
                    color: Color.fromRGBO(0, 141, 82, 1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 60.0,
                          backgroundColor: Colors.white,
                          child: SizedBox(
                            height: 50.0,
                            child: Image.asset(
                              'assets/avatar.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          } else {
            return Drawer(
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    final name = snapshot.data[index]['name'];
                    final fatherName = snapshot.data[index]['father_name'];
                    final phoneNum = snapshot.data[index]['mobile_no'];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          color: Color.fromRGBO(0, 141, 82, 1),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: 50.0),
                              DisplayImage(
                                database: database,
                              ),
                              SizedBox(height: 20.0),
                              Text(
                                '$name',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                ),
                              ),
                              SizedBox(height: 2.0),
                              Text(
                                '$fatherName',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                ),
                              ),
                              SizedBox(height: 2.0),
                              Text(
                                '$phoneNum',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                ),
                              ),
                              SizedBox(height: 30.0),
                            ],
                          ),
                        ),
                        ListTile(
                          title: Text('Item 1'),
                          onTap: () {
                            // Update the state of the app.
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text('Item 1'),
                          onTap: () {},
                        ),
                        ListTile(
                          title: Text('Item 2'),
                          onTap: () {},
                        ),
                        ListTile(
                          title: Text('Item 3'),
                          onTap: () {},
                        ),
                        ListTile(
                          title: Text('Item 4'),
                          onTap: () {},
                        ),
                        SizedBox(height: 150.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35.0),
                          child: RaisedButton(
                            color: Color.fromRGBO(255, 203, 0, 1),
                            onPressed: () => auth.signOutUser(),
                            child: Text(
                              'Logout',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            );
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
