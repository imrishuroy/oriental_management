import 'package:flutter/material.dart';
import 'package:oriental_management/screens/add_profile_screen.dart';
import 'package:oriental_management/screens/edit_profile_screen.dart';
import 'package:oriental_management/services/database_service.dart';

class UserProfile extends StatelessWidget {
  final DataBase database;

  const UserProfile({Key key, this.database}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final data = Provider.of<DataBase>(context, listen: false);
    // return
    //  print(dataBase.userData());

    return StreamBuilder(
      stream: database.userData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            if (snapshot.data.length == 0) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70.0),
                    child: RaisedButton(
                      color: Color.fromRGBO(255, 203, 0, 1),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddProfileScreen(
                              database: database,
                            ),
                          ),
                        );
                      },
                      child: Text('Add Your Profile'),
                    ),
                  ),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 25.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25.0,
                          vertical: 4.0,
                        ),
                        child: Text(
                          'Name',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25.0,
                        ),
                        child: Text(
                          '${snapshot.data[index]['name']}',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25.0,
                          vertical: 4.0,
                        ),
                        child: Text(
                          'Father\'s name',
                          style: TextStyle(fontSize: 18.0, color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25.0,
                        ),
                        child: Text(
                          '${snapshot.data[index]['father_name']}',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25.0,
                          vertical: 4.0,
                        ),
                        child: Text(
                          'Mother\'s Name',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25.0,
                        ),
                        child: Text(
                          '${snapshot.data[index]['mother_name']}',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25.0,
                          vertical: 4.0,
                        ),
                        child: Text(
                          'Mobile Number',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25.0,
                        ),
                        child: Text(
                          '${snapshot.data[index]['mobile_no']}',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 50.0),
                      Center(
                        child: ElevatedButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditProfileScreen(
                                database: database,
                              ),
                            ),
                          ),
                          child: Text('Edit Profile'),
                        ),
                      )
                    ],
                  );
                },
              );
            }
          } else {
            return Container();
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
